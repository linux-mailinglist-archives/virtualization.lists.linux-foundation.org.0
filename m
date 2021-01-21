Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 857382FECDB
	for <lists.virtualization@lfdr.de>; Thu, 21 Jan 2021 15:29:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3FD0784A43;
	Thu, 21 Jan 2021 14:29:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kWyx6feVOomQ; Thu, 21 Jan 2021 14:29:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D5F1B84ABB;
	Thu, 21 Jan 2021 14:29:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9DCEC013A;
	Thu, 21 Jan 2021 14:29:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71C16C013A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 14:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5846E84ABB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 14:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E120ltYdq30k
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 14:29:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8AE4284A43
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 14:29:26 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a10so2851540ejg.10
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 06:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=6d+dhFnF8O5Dji9MI3uQGCEsi3R81Xte/6yH406EepA=;
 b=iAMU6N4iZaZA9+7UD8H8MnQtQ2Cpe3YeQRtcdIAvDIMVUVH+8jruJobsWtbta2pu9/
 TS8Em6eCbSnkRLg6QmIFMfSZ5NJiLC+P0inASmZ1ck5hcL92XvnYfrUlOIh5NEockg3M
 sngnJTujgRmBntErYNkPTd0lC5Q5BMFqfS/xZ+2i8/20XXJh1hncFJ8r/5F4dE4HO8vc
 msi5NMvm1FcfSz2eZTGnR8q8mysXQrGwM4CEPaKERmRRfWMj9G4a+EFmcV5fQkZvfVMO
 B83i0efToxwbo6fT4gVOFQj0cp9m8jld4Df7IpwukDPFpkDLwdoGd2XTiQfnKp9lWEKD
 guUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6d+dhFnF8O5Dji9MI3uQGCEsi3R81Xte/6yH406EepA=;
 b=oS04xeviZwQeJyh6rHZwBb0tN+Hj+oV8losxCJk8u9dfnWqnO/JrWr3okfWqePW7CJ
 ERQ4yaJG2oP6nsEqUZAadyjbYBhN7CZyxhMhra0wPjLnAJ72vUM7dCK81rv4CM5BPqjQ
 88vnnHIvTtQ6QW+5nIcWw33Nfx89e3MhaJaTuGgk8HboQnwMvQ889/1abGlxXpphPvrF
 G8MOxAH+FsIMEAvqNyzqAJGURuIwqsfO+TKBzanrQmjLqPvSfwhTTw8xLitHG3woaFae
 lcsgJSb05mTqIKhARS+4byFvdOi6b5u19p1tZ0Ui8/2se2fNGwJ+D0rEHWXvJM9kqyyV
 303w==
X-Gm-Message-State: AOAM533NeR0iJ/WZm3fSsGFheP1dCgUs2NzuJxnIp+epT9rXsD4whxYH
 BoZRXhLu2ltT83NIfMgitWZJQg==
X-Google-Smtp-Source: ABdhPJxCDi5bLwTWjg3Cogi17XLUs88z2mnzLi3uB5dGCnmO1AkoP5tvuP3B7w2NbRmf5F5CDrtLTw==
X-Received: by 2002:a17:906:95cf:: with SMTP id
 n15mr9672034ejy.178.1611239364997; 
 Thu, 21 Jan 2021 06:29:24 -0800 (PST)
Received: from ls00508.pb.local ([2001:1438:4010:2540:481b:68e3:af3e:e933])
 by smtp.gmail.com with ESMTPSA id gt18sm2263684ejb.104.2021.01.21.06.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 06:29:24 -0800 (PST)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: axboe@kernel.dk
Subject: [PATCH 0/2] remove unused argument from blk_execute_rq_nowait and
 blk_execute_rq
Date: Thu, 21 Jan 2021 15:29:03 +0100
Message-Id: <20210121142905.13089-1-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-nfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 linux-ide@vger.kernel.org, target-devel@vger.kernel.org
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
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
