Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD5930217F
	for <lists.virtualization@lfdr.de>; Mon, 25 Jan 2021 05:57:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6854A86F72;
	Mon, 25 Jan 2021 04:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 98dbGARsgfv5; Mon, 25 Jan 2021 04:57:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CA86786F89;
	Mon, 25 Jan 2021 04:57:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6A17C013A;
	Mon, 25 Jan 2021 04:57:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB33EC013A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Jan 2021 04:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DF52B85C28
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Jan 2021 04:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fyCnVsraOwHC
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Jan 2021 04:56:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4B88D85758
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Jan 2021 04:56:59 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id f11so13696753ljm.8
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Jan 2021 20:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=1QOy2CBTli39v+zKLvkwbYlNYYcskK1HWR3qTfGjr/s=;
 b=G5WxyZUyXn2TcQ2TUWNRcJXDXSWCQkRfwFMjOzhWd2VG0x8Al9J87MMoGSZg8Zo5Kw
 JHttGPILbg1UDvjztvtFKR9QxHcJKRQ+GdPrGD+3B0IIrgffQ6Wl7S68CdBozUyvVCNW
 KASF7GF/jowIwiKDzLDjVFpb0mH17+yia19Xi+ej48Gp5tfoyeDg7rssffnwxCHGX9h0
 mPNJsUljmKd9FlunBUeh57kJjwtktU2E8+k3+QKXMom4TZRlabJNskiG/59h0WBWK/on
 hh5rtkOZq0DoJnY//4krP33/IiGcygcB/3YT7yWIbl9Kf/sEJZaDdovEwDFLrIJxk4m4
 7Y+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1QOy2CBTli39v+zKLvkwbYlNYYcskK1HWR3qTfGjr/s=;
 b=XKdmQ1Ppb8DQL31v4vgDWArLXOrNTRxtjebRAYIw16Ny7xvQs+iO6Y0sgf9UOze2XA
 q2Z3yv2F2Xj6LKR1PxBw+UNgY2ZlJ0YDuznH3t2e7PwV420+ob80cn3qyb+Cj5BJNITm
 CZxlxPbeB650ygrQrHfv5RJ6dHhes5b3ew2aSnyCX+BTpKsyYFp0M98GWiZcFdAB/ygf
 IgW1LKvDZDoZ7T5/rkr3pDR8+anm/dBdMlfpEfTsmhARh83Cb/xsTH/y6QVWGvHMDaNz
 /GtYKYs69gCS02tHF0zyLmVf/enu8ofpvgRXCN1tQXALviLNKQ/n/bnLtQOG3s2fzZcb
 HdLg==
X-Gm-Message-State: AOAM530PXtjSA53vczQM11xY0emqJ3foTrjlOZJuURwu1nIocmc6BvmB
 mCLake9z829rPUHLSjo5vT7+4NdVJVHL+A==
X-Google-Smtp-Source: ABdhPJy9JWWDNN0mRi0G9IluzOoJiSMRJOLAXNAMVlwM18EUSiXPydwWoMS8dIEKe5strOocpzPtPg==
X-Received: by 2002:a17:90a:aa8a:: with SMTP id
 l10mr894891pjq.86.1611550233842; 
 Sun, 24 Jan 2021 20:50:33 -0800 (PST)
Received: from gqjiang-home.profitbricks.net ([185.125.207.232])
 by smtp.gmail.com with ESMTPSA id l14sm16459423pjy.15.2021.01.24.20.50.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 Jan 2021 20:50:32 -0800 (PST)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: axboe@kernel.dk
Subject: [PATCH V3 0/2] remove unused argument from blk_execute_rq_nowait and
 blk_execute_rq
Date: Mon, 25 Jan 2021 05:49:56 +0100
Message-Id: <1611550198-17142-1-git-send-email-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.7.4
Cc: hch@infradead.org, linux-nfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 linux-ide@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

V3 changes:
1. rebase with for-5.12/block branch.
2. add Ulf's Acked-by.

V2 changes:
1. update commit header per Christoph's comment.

Hi Jens,

This series remove unused 'q' from blk_execute_rq_nowait and blk_execute_rq.
Also update the comment for blk_execute_rq_nowait.

Thanks,
Guoqing

Guoqing Jiang (2):
  block: remove unnecessary argument from blk_execute_rq_nowait
  block: remove unnecessary argument from blk_execute_rq

 block/blk-exec.c                   | 13 +++++--------
 block/bsg.c                        |  2 +-
 block/scsi_ioctl.c                 |  6 +++---
 drivers/block/mtip32xx/mtip32xx.c  |  2 +-
 drivers/block/paride/pd.c          |  2 +-
 drivers/block/pktcdvd.c            |  2 +-
 drivers/block/sx8.c                |  4 ++--
 drivers/block/virtio_blk.c         |  2 +-
 drivers/cdrom/cdrom.c              |  2 +-
 drivers/ide/ide-atapi.c            |  2 +-
 drivers/ide/ide-cd.c               |  2 +-
 drivers/ide/ide-cd_ioctl.c         |  2 +-
 drivers/ide/ide-devsets.c          |  2 +-
 drivers/ide/ide-disk.c             |  2 +-
 drivers/ide/ide-ioctls.c           |  4 ++--
 drivers/ide/ide-park.c             |  2 +-
 drivers/ide/ide-pm.c               |  4 ++--
 drivers/ide/ide-tape.c             |  2 +-
 drivers/ide/ide-taskfile.c         |  2 +-
 drivers/mmc/core/block.c           | 10 +++++-----
 drivers/nvme/host/core.c           |  8 ++++----
 drivers/nvme/host/lightnvm.c       |  4 ++--
 drivers/nvme/host/pci.c            |  4 ++--
 drivers/nvme/target/passthru.c     |  2 +-
 drivers/scsi/scsi_error.c          |  2 +-
 drivers/scsi/scsi_lib.c            |  2 +-
 drivers/scsi/sg.c                  |  3 +--
 drivers/scsi/st.c                  |  2 +-
 drivers/target/target_core_pscsi.c |  3 +--
 fs/nfsd/blocklayout.c              |  2 +-
 include/linux/blkdev.h             |  5 ++---
 31 files changed, 50 insertions(+), 56 deletions(-)

-- 
2.7.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
