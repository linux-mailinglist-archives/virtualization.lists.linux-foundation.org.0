Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 670FB739742
	for <lists.virtualization@lfdr.de>; Thu, 22 Jun 2023 08:14:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 142C360E02;
	Thu, 22 Jun 2023 06:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 142C360E02
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eQlXRADa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yli_w0j7xKfx; Thu, 22 Jun 2023 06:14:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C6FEF60C05;
	Thu, 22 Jun 2023 06:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6FEF60C05
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16942C0089;
	Thu, 22 Jun 2023 06:14:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17A5CC0029
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Jun 2023 06:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD4CA41DC0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Jun 2023 06:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD4CA41DC0
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=eQlXRADa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IwIrnmM9ApZ8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Jun 2023 06:14:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E02741C01
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E02741C01
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Jun 2023 06:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687414479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6U7Jgyq5pY8OJlZBHmNv7DI17/H9KRKPjBl2RMWjLNY=;
 b=eQlXRADauHtV6adGbPVg3hhHZh6zV4Oak+znCLKYv4+HNT7a6g/JVXSeZdwEyASVFkrRsc
 DTyJuJUJuitnDHT8+wM8LTMw1g0g8CJDYPLTOC41f2ybMBgahA7oyKLp6HCM/RvCRcvVnA
 3jI8tBZjDQblTeL3vmVnRSDZFZ/ZSu8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-olKpgxwZOZqsv2ILqRPkkg-1; Thu, 22 Jun 2023 02:14:37 -0400
X-MC-Unique: olKpgxwZOZqsv2ILqRPkkg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-987accb96dbso349455866b.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Jun 2023 23:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687414477; x=1690006477;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6U7Jgyq5pY8OJlZBHmNv7DI17/H9KRKPjBl2RMWjLNY=;
 b=e1qLK9CgabuMVXjegoMLaQd4SUWXLy3mzO4cWmCWrAtxCgVgVGcJW64PC/RVDnBIJ8
 AOEPEbe3rD2yG8xETBHhgQ26VfuabPmSGxSMXZWj8P8wA+gwoZ1uhk/LMvK6yAV308Fi
 dmKPOhbk6kbyKc2tW7UFcwAlZ6PWp7c4qktHT9Uw9RWpf4dmVs1G2l4VldxgNW5W1njp
 0hEMS/T2QxxxPCdqZqkR4K33B5DcOL4JqJxUM8pNLPW0RjPRdh+VJQs2XpW6mViwCCPD
 r/fTYO0jpBWGSIAGd9ERKIBVw5OV6+uoP0eWLEyMpWLWlrhXJFqoF/RZ0G5Ndnq/WsHs
 pIrg==
X-Gm-Message-State: AC+VfDxmwisMyD0yNjs9mYcEStex+y9PpJNH4NoTaJmFLpDdhZo+mCfM
 CdN8NpwW9P09k2Dn8Dd4uJnb6ALrqz4kyG0Gt0TTUYJSszj12Dq35RIy5AOqexZoxHR/In1TrDs
 n1UftiiBf9vFKLineZYL5DUWApvnbbJEfsn7PFGotIg==
X-Received: by 2002:a17:907:1c07:b0:94f:956:b3f7 with SMTP id
 nc7-20020a1709071c0700b0094f0956b3f7mr18112703ejc.2.1687414476837; 
 Wed, 21 Jun 2023 23:14:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4kiHBugT6iJqkIz8a+U0lLXflhRfdcAKLD7sLp+R33WreQ6sCwEufnpAYyQ9KBgPCLpee+bA==
X-Received: by 2002:a17:907:1c07:b0:94f:956:b3f7 with SMTP id
 nc7-20020a1709071c0700b0094f0956b3f7mr18112634ejc.2.1687414475008; 
 Wed, 21 Jun 2023 23:14:35 -0700 (PDT)
Received: from redhat.com ([2.52.159.126]) by smtp.gmail.com with ESMTPSA id
 i7-20020a170906698700b009745417ca38sm4083600ejr.21.2023.06.21.23.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 23:14:34 -0700 (PDT)
Date: Thu, 22 Jun 2023 02:14:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Edward Liaw <edliaw@google.com>
Subject: Re: [PATCH v2] Revert "virtio-blk: support completion batching for
 the IRQ path"
Message-ID: <20230622021322-mutt-send-email-mst@kernel.org>
References: <336455b4f630f329380a8f53ee8cad3868764d5c.1686295549.git.mst@redhat.com>
 <ZJIuG9hyTYIIDbF5@google.com>
MIME-Version: 1.0
In-Reply-To: <ZJIuG9hyTYIIDbF5@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 kernel test robot <lkp@intel.com>, "Roberts,
 Martin" <martin.roberts@intel.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Suwan Kim <suwan.kim027@gmail.com>,
 virtualization@lists.linux-foundation.org
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

On Tue, Jun 20, 2023 at 10:54:19PM +0000, Edward Liaw wrote:
> On Fri, Jun 09, 2023 at 03:27:24AM -0400, Michael S. Tsirkin wrote:
> > This reverts commit 07b679f70d73483930e8d3c293942416d9cd5c13.
> This commit was also breaking kernel tests on a virtual Android device
> (cuttlefish).  We were seeing hangups like:
> 
> [ 2889.910733] INFO: task kworker/u8:2:6312 blocked for more than 720 seconds.
> [ 2889.910967]       Tainted: G           OE      6.2.0-mainline-g5c05cafa8df7-ab9969617 #1
> [ 2889.911143] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [ 2889.911389] task:kworker/u8:2    state:D stack:12160 pid:6312  ppid:2      flags:0x00004000
> [ 2889.911567] Workqueue: writeback wb_workfn (flush-254:57)
> [ 2889.911771] Call Trace:
> [ 2889.911831]  <TASK>
> [ 2889.911893]  __schedule+0x55f/0x880
> [ 2889.912021]  schedule+0x6a/0xc0
> [ 2889.912110]  schedule_timeout+0x58/0x1a0
> [ 2889.912200]  wait_for_common+0xf7/0x1b0
> [ 2889.912289]  wait_for_completion+0x1c/0x40
> [ 2889.912377]  f2fs_issue_checkpoint+0x14c/0x210
> [ 2889.912504]  f2fs_sync_fs+0x4c/0xb0
> [ 2889.912597]  f2fs_balance_fs_bg+0x2f6/0x340
> [ 2889.912736]  ? can_migrate_task+0x39/0x2b0
> [ 2889.912872]  f2fs_write_node_pages+0x77/0x240
> [ 2889.912989]  do_writepages+0xde/0x240
> [ 2889.913094]  __writeback_single_inode+0x3f/0x360
> [ 2889.913231]  writeback_sb_inodes+0x320/0x5f0
> [ 2889.913349]  ? move_expired_inodes+0x58/0x210
> [ 2889.913470]  __writeback_inodes_wb+0x97/0x100
> [ 2889.913587]  wb_writeback+0x17e/0x390
> [ 2889.913682]  wb_workfn+0x35f/0x500
> [ 2889.913774]  process_one_work+0x1d9/0x3b0
> [ 2889.913870]  worker_thread+0x251/0x410
> [ 2889.913960]  kthread+0xeb/0x110
> [ 2889.914052]  ? __cfi_worker_thread+0x10/0x10
> [ 2889.914168]  ? __cfi_kthread+0x10/0x10
> [ 2889.914257]  ret_from_fork+0x29/0x50
> [ 2889.914364]  </TASK>
> [ 2889.914565] INFO: task mkdir09:6425 blocked for more than 720 seconds.
> [ 2889.916065]       Tainted: G           OE      6.2.0-mainline-g5c05cafa8df7-ab9969617 #1
> [ 2889.916255] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [ 2889.916450] task:mkdir09         state:D stack:13016 pid:6425  ppid:6423   flags:0x00004000
> [ 2889.916656] Call Trace:
> [ 2889.916900]  <TASK>
> [ 2889.917004]  __schedule+0x55f/0x880
> [ 2889.917129]  schedule+0x6a/0xc0
> [ 2889.917273]  schedule_timeout+0x58/0x1a0
> [ 2889.917425]  wait_for_common+0xf7/0x1b0
> [ 2889.917535]  wait_for_completion+0x1c/0x40
> [ 2889.917670]  f2fs_issue_checkpoint+0x14c/0x210
> [ 2889.917844]  f2fs_sync_fs+0x4c/0xb0
> [ 2889.917969]  f2fs_do_sync_file+0x3a8/0x8c0
> [ 2889.918090]  ? mt_find+0xa0/0x1a0
> [ 2889.918216]  f2fs_sync_file+0x2f/0x60
> [ 2889.918310]  vfs_fsync_range+0x74/0x90
> [ 2889.918567]  __se_sys_msync+0x176/0x270
> [ 2889.918730]  __x64_sys_msync+0x1c/0x40
> [ 2889.918873]  do_syscall_64+0x53/0xb0
> [ 2889.918996]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [ 2889.919178] RIP: 0033:0x7540b08bcf47
> [ 2889.919297] RSP: 002b:00007fff5fcbeea8 EFLAGS: 00000206 ORIG_RAX: 000000000000001a
> [ 2889.919496] RAX: ffffffffffffffda RBX: 0000000000001000 RCX: 00007540b08bcf47
> [ 2889.919828] RDX: 0000000000000004 RSI: 0000000000001000 RDI: 00007540b4ae7000
> [ 2889.920227] RBP: 0000000000000000 R08: 721e0000010b0016 R09: 0000000000000003
> [ 2889.920435] R10: 0000000000000100 R11: 0000000000000206 R12: 00005d2f95fd2f08
> [ 2889.920793] R13: 00005d2f95fbc310 R14: 00007540b08e1bb8 R15: 00005d2f95fbc310
> [ 2889.921072]  </TASK>
> 
> in random tests in the LTP (linux test project) test suite.
> 
> > ---
> > 
> > Since v1:
> > 	fix build error
> > 
> > Still completely untested as I'm traveling.
> > Martin, Suwan, could you please test and report?
> > Suwan if you have a better revert in mind pls post and
> > I will be happy to drop this.
> > 
> > Thanks!
> > 
> This revert appears to have resolved the test failures for me.
> 
> Tested-by: edliaw@google.com

Oh interesting, can you share how to reproduce the failures?
Then maybe Suwan Kim can take a look at fixing up the patch.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
