Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 986FB79EA52
	for <lists.virtualization@lfdr.de>; Wed, 13 Sep 2023 16:01:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D26FA402A2;
	Wed, 13 Sep 2023 14:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D26FA402A2
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rBz+MQBd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZTkOmVpzVmd; Wed, 13 Sep 2023 14:01:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 53B7F4022F;
	Wed, 13 Sep 2023 14:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53B7F4022F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3E12C0DD3;
	Wed, 13 Sep 2023 14:01:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB795C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 Sep 2023 14:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 939604022F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 Sep 2023 14:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 939604022F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zBOFrIfnWxeF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 Sep 2023 14:00:58 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C46740149
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 Sep 2023 14:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C46740149
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9a645e54806so858012766b.0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 Sep 2023 07:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694613656; x=1695218456;
 darn=lists.linux-foundation.org; 
 h=in-reply-to:references:message-id:from:to:cc:subject:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qSNk7yJ2+UkE4vtPspF4OyK8GwrUUVuFyR6yxeutkDg=;
 b=rBz+MQBdEjoMZ66wxJhtmXGVydeQrkZ9tfGy4Y5OXONvXT+cEcEsJtlCr/lG3wfDgY
 TKaewkbcYD1mn/4FcGdlYo3iwAMn1rq1ZzyvSuxmn8zcndidK+QV+6KlokaDvNAMEgbn
 gHBWfntbUszKSJgmklzi4SJHUMfmz71wtqIWthhZ9TViGeg3neChE+lYN6EvyxRVX8PB
 dC9J/qocgg7UkclqQe6ngNgFwGjOLs0ALIu76OjQnkwc/izzqujEqC5B22a0xDxYCNRI
 D8dfU+h0YfR72ax+fxI/qHo/f8F6VZSCjJdpBC1EqdWwb+4v6et3YAcTuZrZOMJvIYHL
 O8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694613656; x=1695218456;
 h=in-reply-to:references:message-id:from:to:cc:subject:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qSNk7yJ2+UkE4vtPspF4OyK8GwrUUVuFyR6yxeutkDg=;
 b=oF6/sZBRNFsbap3FhyxVFxS3U1RE3Bsry1QVrY1YN2jXE/bfx2IryaMzuQeag7RbNW
 /WpSQ1R41ZbYk+8iZtZHIaxV/aDXOMqU5+rWe0KezpXDfDXpcvA/+JJXpNmVLOY2DCdJ
 VKLXjlVD7OaHza29gQh/+nwE2uM56okA1e04UkMacFYdtx/irEY2coclIMhGnRJd0R1Q
 y0+xw4apw1pufWXkI7NiCmpWcBvvT2QALFSdXgR8FeG0qI7eHT6S8i2M0vuWZpTDpXwC
 b2yuTRwYLI/08vniq35xbAIwElyF/CNLMA+wfNw0HkCI0M7C2dir9vv+Ar9KiwhxLbpm
 HCyQ==
X-Gm-Message-State: AOJu0YxNwh1opSySnfaeOqV5OdfkA5ppssakHmCFzOzxkoHi0pzTvGuq
 a5NPXmIlsNPBgTbCxwuWzMXI2w==
X-Google-Smtp-Source: AGHT+IEnExGvhYe3SVvTRS9+qNylheJdrEEnjeSefUhoh07c6LG4RCnrLEESqo9lAkKsyNuERrSyFw==
X-Received: by 2002:a17:907:75e5:b0:9a2:276d:d84c with SMTP id
 jz5-20020a17090775e500b009a2276dd84cmr1765692ejc.12.1694613655792; 
 Wed, 13 Sep 2023 07:00:55 -0700 (PDT)
Received: from localhost (i5C74380B.versanet.de. [92.116.56.11])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a1709064f0e00b0099e05fb8f95sm8528353eju.137.2023.09.13.07.00.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 07:00:55 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 13 Sep 2023 16:00:54 +0200
Subject: Re: [BUG] virtio-fs: Corruption when running binaries from
 virtiofsd-backed fs
To: "Erik Schilling" <erik.schilling@linaro.org>,
 <virtualization@lists.linux-foundation.org>,
 <linux-fsdevel@vger.kernel.org>, <virtio-fs@redhat.com>
From: "Erik Schilling" <erik.schilling@linaro.org>
Message-Id: <CVHU6DMDF441.2AQHB25WSIWR3@ablu-work>
X-Mailer: aerc 0.15.2
References: <CV5Q388ZKSI3.2N5DT3BRV3RIM@fedora>
 <CV7IJY36ZXDZ.250Z3B8VKN4Y5@ablu-work>
 <CVHKGP2HRKVG.TEIWT3U6ZVTX@ablu-work>
In-Reply-To: <CVHKGP2HRKVG.TEIWT3U6ZVTX@ablu-work>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Miklos Szeredi <miklos@szeredi.hu>, German Maglione <gmaglione@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, Hanna Czenczek <hreitz@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CCing a few more people as suggested by stefanha on #qemu.

On Wed Sep 13, 2023 at 8:18 AM CEST, Erik Schilling wrote:
> On Fri Sep 1, 2023 at 12:37 PM CEST, Erik Schilling wrote:
> > On Wed Aug 30, 2023 at 10:20 AM CEST, Erik Schilling wrote:
> > > Hi all!
> > >
> > > Some days ago I posted to #virtiofs:matrix.org, describing that I am
> > > observing what looks like a corruption when executing programs from a
> > > virtiofs-based filesystem.
> > >
> > > Over the last few days I spent more time drilling into the problem.
> > > This is an attempt at summarizing my findings in order to see what other
> > > people think about this.
> > >
> > > When running binaries mounted from virtiofs they may either: fail with a
> > > segfault, fail with badaddr, get stuck or - sometimes - succeed.
> > >
> > > Environment:
> > >   Host: Fedora 38 running 6.4.11-200.fc38.x86_64
> > >   Guest: Yocto-based image: 6.4.9-yocto-standard, aarch64
> > >   virtiofsd: latest main + some debug prints [1]
> > >   QEMU: built from recent git [2]
> > >
> > > virtiofsd invocation:
> > >   RUST_LOG="debug" ./virtiofsd --seccomp=none --sandbox=none \
> > >     --socket-path "fs.sock0" --shared-dir $PWD/share-dir/ --cache=never
> > >
> > > QEMU invocation:
> > >   ~/projects/qemu/build/qemu-system-aarch64 -kernel Image -machine virt \
> > >     -cpu cortex-a57 \
> > >     -serial mon:stdio \
> > >     -device virtio-net-pci,netdev=net0 \
> > >     -netdev user,id=net0,hostfwd=tcp::2223-:22 \
> > >     -display none -m 2048 -smp 4 \
> > >     -object memory-backend-memfd,id=mem,size=2048M,share=on \
> > >     -numa node,memdev=mem \
> > >     -hda trs-overlay-guest.qcow2 \
> > >     -chardev socket,id=char0,path="fs.sock0" \
> > >     -device vhost-user-fs-pci,queue-size=1024,chardev=char0,tag=/dev/root \
> > >     -append 'root=/dev/vda2 ro log_buf_len=8M'
> > >
> > > I figured that launching virtiofsd with --cache=always masks the
> > > problem. Therefore, I set --cache=never, but I think I observed no
> > > difference compared to the default setting (auto).
> > >
> > > Adding logging to virtiofsd and kernel _feeled_ like it made the problem
> > > harder to reproduce - leaving me with the impression that some race is
> > > happening on somewhere.
> > >
> > > Trying to rule out that virtiofsd is returning corrupted data, I added
> > > some logging and hashsum calculation hacks to it [1]. The hashes check
> > > out across multiple accesses and the order and kind of queued messages
> > > is exactly the same in both the error case and crash case. fio was also
> > > unable to find any errors with a naive job description [3].
> > >
> > > Next, I tried to capture info on the guest side. This became a bit
> > > tricky since the crashes became pretty rare once I followed a fixed
> > > pattern of starting log capture, running perf and trying to reproduce
> > > the problem. Ultimately, I had the most consistent results with
> > > immediately running a program twice:
> > >
> > >   /mnt/ld-linux-aarch64.so.1 /mnt/ls.coreutils /; \
> > >     /mnt/ld-linux-aarch64.so.1 /mnt/ls.coreutils /
> > >
> > >   (/mnt being the virtiofs mount)
> > >
> > > For collecting logs, I made a hack to the guest kernel in order to dump
> > > the page content after receiving the virtiofs responses [4]. Reproducing
> > > the problem with this, leaves me with logs that seem to suggest that
> > > virtiofsd is returning identical content, but the guest kernel seems to
> > > receive differing pages:
> > >
> > > good-kernel [5]:
> > >   kernel: virtio_fs_wake_pending_and_unlock: opcode 3 unique 0x312 nodeid 0x1 in.len 56 out.len 104
> > >   kernel: virtiofs virtio1: virtio_fs_vq_done requests.0
> > >   kernel: virtio_fs_wake_pending_and_unlock: opcode 1 unique 0x314 nodeid 0x1 in.len 53 out.len 128
> > >   kernel: virtiofs virtio1: virtio_fs_vq_done requests.0
> > >   kernel: virtio_fs_wake_pending_and_unlock: opcode 3 unique 0x316 nodeid 0x29 in.len 56 out.len 104
> > >   kernel: virtiofs virtio1: virtio_fs_vq_done requests.0
> > >   kernel: virtio_fs_wake_pending_and_unlock: opcode 14 unique 0x318 nodeid 0x29 in.len 48 out.len 16
> > >   kernel: virtiofs virtio1: virtio_fs_vq_done requests.0
> > >   kernel: virtio_fs_wake_pending_and_unlock: opcode 15 unique 0x31a nodeid 0x29 in.len 80 out.len 832
> > >   kernel: virtiofs virtio1: virtio_fs_vq_done requests.0
> > >   kernel: virtio_fs: page: 000000006996d520
> > >   kernel: virtio_fs: to: 00000000de590c14
> > >   kernel: virtio_fs rsp:00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> > >   kernel: virtio_fs rsp:00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> > >   kernel: virtio_fs rsp:00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> > >   kernel: virtio_fs rsp:00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> > >   [...]
> > >
> > > bad-kernel [6]:
> > >   kernel: virtio_fs_wake_pending_and_unlock: opcode 3 unique 0x162 nodeid 0x1 in.len 56 out.len 104
> > >   kernel: virtiofs virtio1: virtio_fs_vq_done requests.0
> > >   kernel: virtio_fs_wake_pending_and_unlock: opcode 1 unique 0x164 nodeid 0x1 in.len 53 out.len 128
> > >   kernel: virtiofs virtio1: virtio_fs_vq_done requests.0
> > >   kernel: virtio_fs_wake_pending_and_unlock: opcode 3 unique 0x166 nodeid 0x16 in.len 56 out.len 104
> > >   kernel: virtiofs virtio1: virtio_fs_vq_done requests.0
> > >   kernel: virtio_fs_wake_pending_and_unlock: opcode 14 unique 0x168 nodeid 0x16 in.len 48 out.len 16
> > >   kernel: virtiofs virtio1: virtio_fs_vq_done requests.0
> > >   kernel: virtio_fs_wake_pending_and_unlock: opcode 15 unique 0x16a nodeid 0x16 in.len 80 out.len 832
> > >   kernel: virtiofs virtio1: virtio_fs_vq_done requests.0
> > >   kernel: virtio_fs: page: 000000006ce9a559
> > >   kernel: virtio_fs: to: 000000007ae8b946
> > >   kernel: virtio_fs rsp:00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> > >   kernel: virtio_fs rsp:00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> > >   kernel: virtio_fs rsp:80 40 de c8 ff ff 00 00 cc 2b 62 ae ff ff 00 00  .@.......+b.....
> > >   kernel: virtio_fs rsp:02 4e de c8 ff ff 00 00 00 00 00 00 00 00 00 00  .N..............
> > >   [...]
> > >
> > > When looking at the corresponding output from virtiofsd, it claims to
> > > have returned identical data:
> > >
> > > good-virtiofsd [7]:
> > >   [DEBUG virtiofsd::server] Received request: opcode=Read (15), inode=41, unique=794, pid=481
> > >   [src/server.rs:618] r.read_obj().map_err(Error::DecodeMessage)? = ReadIn {
> > >       fh: 31,
> > >       offset: 0,
> > >       size: 832,
> > >       read_flags: 2,
> > >       lock_owner: 6838554705639967244,
> > >       flags: 131072,
> > >       padding: 0,
> > >   }
> > >   [src/file_traits.rs:161] hash = 2308490450751364994
> > >   [DEBUG virtiofsd::server] Replying OK, header: OutHeader { len: 848, error: 0, unique: 794 }
> > >
> > > bad-virtiofsd [8]:
> > >   [DEBUG virtiofsd::server] Received request: opcode=Read (15), inode=22, unique=362, pid=406
> > >   [src/server.rs:618] r.read_obj().map_err(Error::DecodeMessage)? = ReadIn {
> > >       fh: 12,
> > >       offset: 0,
> > >       size: 832,
> > >       read_flags: 2,
> > >       lock_owner: 6181120926258395554,
> > >       flags: 131072,
> > >       padding: 0,
> > >   }
> > >   [src/file_traits.rs:161] hash = 2308490450751364994
> > >   [DEBUG virtiofsd::server] Replying OK, header: OutHeader { len: 848, error: 0, unique: 362 }
> > >
> > > The "corruption" only seems to happen in this one page, all other pages
> > > are identical between runs (except that the bad run terminates earlier).
> > >
> > > What do the experts think here? To me it feels a bit like some kind of
> > > corruption is going on. Or am I misinterpreting things here?
> > >
> > > Which further analysis steps would you suggest?
> > >
> > >
> > > Further notes:
> > >
> > > After collecting the above results, I realized that running the guest
> > > with -smp 1 makes the problems a lot worse. So maybe that is a better
> > > choice when trying to reproduce it.
> > >
> > > Repo with my scripts is available at:
> > > https://git.codelinaro.org/erik_schilling/jira-orko-65-bootstrap-k3s-config/
> > >
> > > The scripts are just quick and dirty implementations and are not
> > > particulary portable.
> >
> > Summary of my testing during the last few days:
> >
> > Testing with KCSAN revealed a few cases that look like missing READ_ONCE
> > annotations (will send patches separately). But nothing of that was
> > related to the immediate problem. I tested instrument_read() and another
> > round of logging with a delay to virtio_fs_request_complete. It looks
> > like the buffer get corrupted before entering that function. KCSAN
> > or manual sleeps + prints did not show any corruption while in that
> > function.
> >
> > KASAN did not report any issues.
> >
> > Patching virtiofsd to do an additional copy and going through rust-vmm's
> > .copy_to() function did not change the behaviour.
> >
> > I will mostly be off next week, will continue analysis afterwards. Happy
> > to hear about suggestions of other things to try :).
>
> Back from a week of vacation...
>
> Summary of what was discussed on #virtiofs:matrix.org:
>
> The issue only seems to happen in QEMU TCG scenarios (I tested aarch64
> and x86_64 on x86_64, wizzard on Matrix tested arm32).
>
> CCing qemu-devel. Maybe someone has some hints on where to focus the
> debugging efforts?
>
> I am trying to build a complex monster script of tracing the relevant
> addresses in order to figure out whether the guest or host does the
> writes. But I am happy to hear about more clever ideas :).

After hearing about investigations of bugs in other virtio scenarios
that seem to be caused by QEMU [9], I tested some older QEMU versions.

Indeed, a882b5712373171d3bd53cd82ddab4453ddef468 did not show the buggy
behaviour. So I did a bisect:

    git bisect start
    # status: waiting for both good and bad commits
    # good: [a882b5712373171d3bd53cd82ddab4453ddef468] Revert "virtio: introduce macro IRTIO_CONFIG_IRQ_IDX"
    git bisect good a882b5712373171d3bd53cd82ddab4453ddef468
    # status: waiting for bad commit, 1 good commit known
    # bad: [9ef497755afc252fb8e060c9ea6b0987abfd20b6] Merge tag 'pull-vfio-20230911' of https://github.com/legoater/qemu into staging
    git bisect bad 9ef497755afc252fb8e060c9ea6b0987abfd20b6
    # skip: [3ba5fe46ea4456a16e2f47ab8e75943b54879c4e] Merge tag 'mips-20221108' of https://github.com/philmd/qemu into staging
    git bisect skip 3ba5fe46ea4456a16e2f47ab8e75943b54879c4e
    # skip: [ade760a2f63804b7ab1839fbc3e5ddbf30538718] Merge tag 'pull-request-2022-11-08' of https://gitlab.com/thuth/qemu into staging
    git bisect skip ade760a2f63804b7ab1839fbc3e5ddbf30538718
    # good: [ad2ca2e3f762b0cb98eb976002569795b270aef1] target/xtensa: Drop tcg_temp_free
    git bisect good ad2ca2e3f762b0cb98eb976002569795b270aef1
    # bad: [19a720b74fde7e859d19f12c66a72e545947a657] Merge tag 'tracing-pull-request' of https://gitlab.com/stefanha/qemu into staging
    git bisect bad 19a720b74fde7e859d19f12c66a72e545947a657
    # bad: [29d9efca16080211f107b540f04d1ed3c12c63b0] arm/Kconfig: Do not build TCG-only boards on a KVM-only build
    git bisect bad 29d9efca16080211f107b540f04d1ed3c12c63b0
    # good: [9636e513255362c4a329e3e5fb2c97dab3c5ce47] Merge tag 'misc-next-pull-request' of https://gitlab.com/berrange/qemu into staging
    git bisect good 9636e513255362c4a329e3e5fb2c97dab3c5ce47
    # bad: [45608654aa63ca2b311d6cb761e1522f2128e00e] Merge tag 'pull-tpm-2023-04-20-1' of https://github.com/stefanberger/qemu-tpm into staging
    git bisect bad 45608654aa63ca2b311d6cb761e1522f2128e00e
    # good: [1ff4a81bd3efb207992f1da267886fe0c4df764f] tcg: use QTree instead of GTree
    git bisect good 1ff4a81bd3efb207992f1da267886fe0c4df764f
    # bad: [9ed98cae151368cc89c4bb77c9f325f7185e8f09] block-backend: ignore inserted state in blk_co_nb_sectors
    git bisect bad 9ed98cae151368cc89c4bb77c9f325f7185e8f09
    # good: [c8cb603293fd329f2a62ade76ec9de3f462fc5c3] tests/avocado: Test Xen guest support under KVM
    git bisect good c8cb603293fd329f2a62ade76ec9de3f462fc5c3
    # bad: [64f1c63d87208e28e8e38c4ab514ada1728960ef] Merge tag 'pull_error_handle_fix_use_after_free.v1' of https://github.com/stefanberger/qemu-tpm into staging
    git bisect bad 64f1c63d87208e28e8e38c4ab514ada1728960ef
    # good: [8a712df4d4d736b7fe6441626677bfd271d95b15] Merge tag 'pull-for-8.0-040423-2' of https://gitlab.com/stsquad/qemu into staging
    git bisect good 8a712df4d4d736b7fe6441626677bfd271d95b15
    # bad: [7d0334e49111787ae19fbc8d29ff6e7347f0605e] Merge tag 'pull-tcg-20230404' of https://gitlab.com/rth7680/qemu into staging
    git bisect bad 7d0334e49111787ae19fbc8d29ff6e7347f0605e
    # bad: [3371802fba3f7be4465f8a5e5777d43d556676ef] accel/tcg: Fix jump cache set in cpu_exec_loop
    git bisect bad 3371802fba3f7be4465f8a5e5777d43d556676ef
    # good: [6cda41daa2162b8e1048124655ba02a8c2b762b4] Revert "linux-user/arm: Take more care allocating commpage"
    git bisect good 6cda41daa2162b8e1048124655ba02a8c2b762b4
    # skip: [c83574392e0af108a643347712564f6749906413] accel/tcg: Fix overwrite problems of tcg_cflags
    git bisect skip c83574392e0af108a643347712564f6749906413
    # only skipped commits left to test
    # possible first bad commit: [3371802fba3f7be4465f8a5e5777d43d556676ef] accel/tcg: Fix jump cache set in cpu_exec_loop
    # possible first bad commit: [c83574392e0af108a643347712564f6749906413] accel/tcg: Fix overwrite problems of tcg_cflags

I had an inclusive test in the end where c83574392e did not yield in me
being able to start the VM.

Whether one of these contains a bug or whether only new behaviour of
QEMU revealed a bug somewhere else is of course still to be figured out.

[9] https://gitlab.com/qemu-project/qemu/-/issues/1866

- Erik

>
> - Erik
>
> >
> > Good weekend,
> >
> > - Erik
> >
> >
> > >
> > > - Erik
> > >
> > > [1] https://gitlab.com/ablu/virtiofsd/-/commit/18fd0c1849e15bc55fbdd6e1f169801b2b03da1f
> > > [2] https://gitlab.com/qemu-project/qemu/-/commit/50e7a40af372ee5931c99ef7390f5d3d6fbf6ec4
> > > [3] https://git.codelinaro.org/erik_schilling/jira-orko-65-bootstrap-k3s-config/-/blob/397a6310dea35973025e3d61f46090bf0c092762/share-dir/write-and-verify-mmap.fio
> > > [4] https://github.com/Ablu/linux/commit/3880b9f8affb01aeabb0a04fe76ad7701dc0bb95
> > > [5] Line 12923: https://git.codelinaro.org/erik_schilling/jira-orko-65-bootstrap-k3s-config/-/blob/main/logs/2023-08-29%2013%3A42%3A35%2B02%3A00/good-drop-bad-1.txt
> > > [6] Line 12923: https://git.codelinaro.org/erik_schilling/jira-orko-65-bootstrap-k3s-config/-/blob/main/logs/2023-08-29%2013%3A42%3A35%2B02%3A00/good-bad-1.txt
> > > [7] https://git.codelinaro.org/erik_schilling/jira-orko-65-bootstrap-k3s-config/-/blob/main/logs/2023-08-29%2013%3A42%3A35%2B02%3A00/virtiofsd.txt#L2538-2549
> > > [8] https://git.codelinaro.org/erik_schilling/jira-orko-65-bootstrap-k3s-config/-/blob/main/logs/2023-08-29%2013%3A42%3A35%2B02%3A00/virtiofsd.txt#L1052-1063

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
