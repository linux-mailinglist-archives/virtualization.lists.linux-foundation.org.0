Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F81174855
	for <lists.virtualization@lfdr.de>; Sat, 29 Feb 2020 18:13:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 61A4F840D2;
	Sat, 29 Feb 2020 17:13:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5CYNvcRHvlIB; Sat, 29 Feb 2020 17:13:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8C731840B8;
	Sat, 29 Feb 2020 17:13:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B779C0177;
	Sat, 29 Feb 2020 17:13:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98609C0177
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 17:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9244B8647A
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 17:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qA7StPHFGYg4
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 17:13:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 46C5A85B00
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 17:13:10 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j16so7237351wrt.3
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 09:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=lhgf96iPi0z9MS616zvm8BxTU7hkNPCLBHb5E9MSaLA=;
 b=DbReMlTPf8v4zoebQMV9Q4jcMDs17/+H2dim9YM0PQdcUdPKPTQutsDEqXtL91ebJ/
 eE5ra5zCOnMjL48DILr73yKJLgYk+Vn307TgJyGRxnLT6DqE1ZviBcSU2OBikV8XaVYM
 lEiOn3BlfCf6QBRFce+2Autd1o6405+VvUk6edJXjSwpxA/+ieoMyZEoxyHRIfr7TUrc
 TOVWn+Tskps6xilAmn2BJoF88xm6sROWZYCPiZcIhSPUZSgtQ5x+A5iRSmBGFpdsz2Hr
 Ifzfyqq77Bvkpxr9Xm2tkDPI8FjXV2Um0tu9+clpmpY3k1XH8b0yHIA9WvADJ8uBMeWC
 mlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lhgf96iPi0z9MS616zvm8BxTU7hkNPCLBHb5E9MSaLA=;
 b=si3DzDGmsFnQ6RQMRpotQtKKpNO4NM+R2Ujidl6x6Bnhi/4A9igj7C2svbiAWI+5Id
 2d1FswIYS5E2QnmImmVYqFVb1LBPZZvaO1hMzMz0cQxLAc9cFRXxpR91atXX0W5vdStL
 YV13KtE3e8FKVP/fxDk2iQ/BGHsQF+rLVpbqpJx/Fgq6KYf09FT95WzlN3IAre8QHjcl
 4A/hCuBpVwm0lYquQxKQAuvzPt6xvtH3ucPILpNnRH9obUENaliO7xY1/hh8ehv5arDl
 SmLZbUiNC2nMS4ZiJnBab8zPDTL2qA9E+wW89i+NHIGg6RVfid2QDwOAMh5qjnM57olc
 sjwA==
X-Gm-Message-State: APjAAAXU08tGhptnzfUq8nglLPoe70eC3+0i0R+8g9ewdcLG0hA4gTXQ
 i9ltYmy+uVOxESPEUBJDL/veIQ==
X-Google-Smtp-Source: APXvYqz7m9YX7xQZrnvv30a7ZslEIm+zbd+LGJiBeWVQEX9iz9R0frwgZcHGTt6u6MMlzGIMPb840A==
X-Received: by 2002:a5d:4fc9:: with SMTP id h9mr11337891wrw.400.1582996388632; 
 Sat, 29 Feb 2020 09:13:08 -0800 (PST)
Received: from f2.redhat.com (bzq-79-177-42-131.red.bezeqint.net.
 [79.177.42.131])
 by smtp.gmail.com with ESMTPSA id r1sm17045046wrx.11.2020.02.29.09.13.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 29 Feb 2020 09:13:08 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] virtio-net: introduce features defined in the spec
Date: Sat, 29 Feb 2020 19:12:58 +0200
Message-Id: <20200229171301.15234-1-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
Cc: yan@daynix.com
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

This series introduce virtio-net features VIRTIO_NET_F_RSC_EXT,
VIRTIO_NET_F_RSS and VIRTIO_NET_F_HASH_REPORT.

Yuri Benditovich (3):
  virtio-net: Introduce extended RSC feature
  virtio-net: Introduce RSS receive steering feature
  virtio-net: Introduce hash report feature

 include/uapi/linux/virtio_net.h | 90 +++++++++++++++++++++++++++++++--
 1 file changed, 86 insertions(+), 4 deletions(-)

-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
