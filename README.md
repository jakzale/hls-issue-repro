Replicating an issue with dynamically linked HLS.

For instance, here is a repro using [`plutus/shell.nix`](https://github.com/input-output-hk/plutus/blob/master/shell.nix) on macOS:


```
[nix-shell:~/Developer/hls-issue-repro]$ haskell-language-server --debug src/Bar.hs 
haskell-language-server version: 1.1.0.0 (GHC: 8.10.4.20210212) (PATH: /nix/store/dw928lhxj22587a474kqlxd0nmpwyw9n-haskell-language-server-exe-haskell-language-server-1.1.0.0/bin/haskell-language-server)
 ghcide setup tester in /Users/jakub/Developer/hls-issue-repro.
Report bugs at https://github.com/haskell/haskell-language-server/issues

Step 1/4: Finding files to test in /Users/jakub/Developer/hls-issue-repro
Found 1 files

Step 2/4: Looking for hie.yaml files that control setup
Found 1 cradle
  ()

Step 3/4: Initializing the IDE

Step 4/4: Type checking the files
2021-05-13 12:22:50.917492 [ThreadId 4] DEBUG hls:	Set files of interest to: [(NormalizedFilePath "/Users/jakub/Developer/hls-issue-repro/src/Bar.hs",OnDisk)]
2021-05-13 12:22:50.919094 [ThreadId 52] DEBUG hls:	hlint:getIdeas:file:NormalizedFilePath "/Users/jakub/Developer/hls-issue-repro/src/Bar.hs"
2021-05-13 12:22:50.919785 [ThreadId 57] INFO hls:	Consulting the cradle for "src/Bar.hs"
2021-05-13 12:22:50.919892 [ThreadId 57] WARNING hls:	No [cradle](https://github.com/mpickering/hie-bios#hie-bios) found for src/Bar.hs.
 Proceeding with [implicit cradle](https://hackage.haskell.org/package/implicit-hie).
You should ignore this message, unless you see a 'Multi Cradle: No prefixes matched' error.
Output from setting up the cradle Cradle {cradleRootDir = "/Users/jakub/Developer/hls-issue-repro", cradleOptsProg = CradleAction: Cabal}
> Build profile: -w ghc-8.10.4.20210212 -O1
> In order, the following will be built (use -v for more details):
>  - hls-issue-repro-0.1.0.0 (lib) (first run)
> Preprocessing library for hls-issue-repro-0.1.0.0..
2021-05-13 12:22:51.342335 [ThreadId 57] DEBUG hls:	Session loading result: Right (ComponentOptions {componentOptions = ["-fbuilding-cabal-package","-O0","-outputdir","/Users/jakub/.cache/hie-bios/dist-hls-issue-repro-ade24e2aae5853c84e13ab5e52d6d2f0/build/x86_64-osx/ghc-8.10.4.20210212/hls-issue-repro-0.1.0.0/build","-odir","/Users/jakub/.cache/hie-bios/dist-hls-issue-repro-ade24e2aae5853c84e13ab5e52d6d2f0/build/x86_64-osx/ghc-8.10.4.20210212/hls-issue-repro-0.1.0.0/build","-hidir","/Users/jakub/.cache/hie-bios/dist-hls-issue-repro-ade24e2aae5853c84e13ab5e52d6d2f0/build/x86_64-osx/ghc-8.10.4.20210212/hls-issue-repro-0.1.0.0/build","-stubdir","/Users/jakub/.cache/hie-bios/dist-hls-issue-repro-ade24e2aae5853c84e13ab5e52d6d2f0/build/x86_64-osx/ghc-8.10.4.20210212/hls-issue-repro-0.1.0.0/build","-i","-i/Users/jakub/.cache/hie-bios/dist-hls-issue-repro-ade24e2aae5853c84e13ab5e52d6d2f0/build/x86_64-osx/ghc-8.10.4.20210212/hls-issue-repro-0.1.0.0/build","-isrc","-i/Users/jakub/.cache/hie-bios/dist-hls-issue-repro-ade24e2aae5853c84e13ab5e52d6d2f0/build/x86_64-osx/ghc-8.10.4.20210212/hls-issue-repro-0.1.0.0/build/autogen","-i/Users/jakub/.cache/hie-bios/dist-hls-issue-repro-ade24e2aae5853c84e13ab5e52d6d2f0/build/x86_64-osx/ghc-8.10.4.20210212/hls-issue-repro-0.1.0.0/build/global-autogen","-I/Users/jakub/.cache/hie-bios/dist-hls-issue-repro-ade24e2aae5853c84e13ab5e52d6d2f0/build/x86_64-osx/ghc-8.10.4.20210212/hls-issue-repro-0.1.0.0/build/autogen","-I/Users/jakub/.cache/hie-bios/dist-hls-issue-repro-ade24e2aae5853c84e13ab5e52d6d2f0/build/x86_64-osx/ghc-8.10.4.20210212/hls-issue-repro-0.1.0.0/build/global-autogen","-I/Users/jakub/.cache/hie-bios/dist-hls-issue-repro-ade24e2aae5853c84e13ab5e52d6d2f0/build/x86_64-osx/ghc-8.10.4.20210212/hls-issue-repro-0.1.0.0/build","-optP-include","-optP/Users/jakub/.cache/hie-bios/dist-hls-issue-repro-ade24e2aae5853c84e13ab5e52d6d2f0/build/x86_64-osx/ghc-8.10.4.20210212/hls-issue-repro-0.1.0.0/build/autogen/cabal_macros.h","-this-unit-id","hls-issue-repro-0.1.0.0-inplace","-hide-all-packages","-Wmissing-home-modules","-no-user-package-db","-package-db","/Users/jakub/.cabal/store/ghc-8.10.4.20210212/package.db","-package-db","/Users/jakub/.cache/hie-bios/dist-hls-issue-repro-ade24e2aae5853c84e13ab5e52d6d2f0/packagedb/ghc-8.10.4.20210212","-package-db","/Users/jakub/.cache/hie-bios/dist-hls-issue-repro-ade24e2aae5853c84e13ab5e52d6d2f0/build/x86_64-osx/ghc-8.10.4.20210212/hls-issue-repro-0.1.0.0/package.conf.inplace","-package-id","aeson-1.5.6.0-z6zU6DDZYE8dGSZNpBOjH","-package-id","base-4.14.1.0","-package-id","bytestring-0.10.12.0","-package-id","deriving-aeson-0.2.6.1-Dk4d0O23Jp7GPvC4Mri3jB","-package-id","template-haskell-2.16.0.0","-package-id","th-utilities-0.2.4.1-6AhXCa9rBg4344HmhaqAdN","-XHaskell2010","Data.Aeson.THReader","Foo","FooId","Bar","-hide-all-packages"], componentRoot = "/Users/jakub/Developer/hls-issue-repro", componentDependencies = ["hls-issue-repro.cabal","cabal.project","cabal.project.local"]},"/nix/store/2x9sjwylbrrajjyncrq498kagkf9nmqp-ghc-shell-for-packages-ghc-8.10.4.20210212-env/lib/ghc-8.10.4.20210212")
2021-05-13 12:22:51.498386 [ThreadId 57] INFO hls:	Using interface files cache dir: /Users/jakub/.cache/ghcide/hls-issue-repro-0.1.0.0-inplace-77b8e6849a4f00fce357e0031ab64e0ecacb7d21
2021-05-13 12:22:51.499953 [ThreadId 57] INFO hls:	Making new HscEnv[hls-issue-repro-0.1.0.0-inplace]
2021-05-13 12:22:51.517969 [ThreadId 57] DEBUG hls:	New Component Cache HscEnvEq: (([],Just HscEnvEq 5),fromList [("cabal.project",Nothing),("cabal.project.local",Nothing),("hls-issue-repro.cabal",Just 2021-05-13 10:02:09.666355723 UTC)])
2021-05-13 12:22:51.531229 [ThreadId 57] DEBUG hls:	Known files updated: fromList [(TargetModule Bar,fromList ["/Users/jakub/Developer/hls-issue-repro/src/Bar.hs"]),(TargetFile NormalizedFilePath "/Users/jakub/Developer/hls-issue-repro/src/Bar.hs",fromList ["/Users/jakub/Developer/hls-issue-repro/src/Bar.hs"]),(TargetModule Data.Aeson.THReader,fromList ["/Users/jakub/Developer/hls-issue-repro/src/Data/Aeson/THReader.hs"]),(TargetModule FooId,fromList ["/Users/jakub/Developer/hls-issue-repro/src/FooId.hs"]),(TargetModule Foo,fromList ["/Users/jakub/Developer/hls-issue-repro/src/Foo.hs"])]
2021-05-13 12:22:51.53178 [ThreadId 57] DEBUG hls:	Restarting build session (aborting the previous one took 0.00s)
2021-05-13 12:22:51.532175 [ThreadId 18] DEBUG hls:	Finishing build session(exception: AsyncCancelled)
2021-05-13 12:22:51.533052 [ThreadId 102] DEBUG hls:	hlint:getIdeas:file:NormalizedFilePath "/Users/jakub/Developer/hls-issue-repro/src/Bar.hs"
2021-05-13 12:22:51.949442 [ThreadId 403] DEBUG hls:	SUCCEEDED LOADING HIE FILE FOR:"/Users/jakub/.cache/ghcide/hls-issue-repro-0.1.0.0-inplace-77b8e6849a4f00fce357e0031ab64e0ecacb7d21/Foo.hie"
2021-05-13 12:22:51.949588 [ThreadId 403] DEBUG hls:	Re-indexing hie file for/Users/jakub/Developer/hls-issue-repro/src/Foo.hs
2021-05-13 12:22:51.952953 [ThreadId 410] INFO hls:	File:     /Users/jakub/Developer/hls-issue-repro/src/Bar.hs
Hidden:   no
Range:    1:1-2:1
Source:   typecheck
Severity: DsError
Message: 
  Program error: /Users/jakub/Developer/hls-issue-repro/src/Bar.hs:8:17: fatal:
  cannot find object file
  ‘/Users/jakub/.cache/ghcide/hls-issue-repro-0.1.0.0-inplace-77b8e6849a4f00fce357e0031ab64e0ecacb7d21/FooId.dyn_o’
  while linking an interpreted expression
2021-05-13 12:22:51.953905 [ThreadId 411] INFO hls:	finish: User TypeCheck (took 0.42s)
2021-05-13 12:22:51.954115 [ThreadId 415] INFO hls:	finish: GetHie (took 0.00s)
Files that failed:
 * /Users/jakub/Developer/hls-issue-repro/src/Bar.hs

Completed (0 files worked, 1 file failed)
2021-05-13 12:22:51.954483 [ThreadId 417] INFO hls:	finish: GenerateCore (took 0.00s)

```
