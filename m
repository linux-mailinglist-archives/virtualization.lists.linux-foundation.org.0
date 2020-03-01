Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A9779174CDC
	for <lists.virtualization@lfdr.de>; Sun,  1 Mar 2020 12:07:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4728E869C8;
	Sun,  1 Mar 2020 11:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zXmNwHWXyUn3; Sun,  1 Mar 2020 11:07:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5E5F2869D9;
	Sun,  1 Mar 2020 11:07:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 424F5C013E;
	Sun,  1 Mar 2020 11:07:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30BF2C013E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2C98F885FF
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:07:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1AK2zNfyMc5
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:07:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 52FE5885FC
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:07:42 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l5so8855488wrx.4
 for <virtualization@lists.linux-foundation.org>;
 Sun, 01 Mar 2020 03:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=WPAuORwrbkB4ejqORHMLpJA5vMlqpdPB+AhAgsDflXM=;
 b=mOPUQqK3AJgJkNEBSHMEPCV+82fgXZn7GNDRI84trMiZwscU05XfVijhJgF9eEJD54
 4x6hste7UN5zFJaydxIWO1fOuk8UHeqF9h6695Bjv/Fg7IdOK4aIb/ikR7bjs7FMfwj3
 JSGy0wVUxewR1R5Dgxwcclq1c7HC2JVtl5bDKn/M58HSoEDNUwJf6p2+jST3poZeMTSd
 1WyQb9wfKQiucR0rMxTbX2ch06W9HlP8037jqdPSQTb4ddfp8aghVMXbpaffLdkUZHaE
 7H3Jzda+5XfaVT6UambplyYg475JWJ5O7tSEj/0VkrMQIhWW7A2OV8HCYp1iYr0TQgGY
 A5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WPAuORwrbkB4ejqORHMLpJA5vMlqpdPB+AhAgsDflXM=;
 b=CFnUs3tE+c0U5tHYiSHGgmyMTj4rVsTffnU4XruHPVmHH2wz/hOzLpgCcC7glYi7s3
 eKFDFzr3lsnx3Te8cUqBz57a6bqmM7gWJrV3VVb3/+omzFl7DkjPIzem5Ia0A5k/aIxK
 7tTDRkXh3JXY+HUbx9RoNFXKSBBqL30d4l2PmC0yoi6vbN8SMP2lGgugQAHwqx5bLPSt
 f2JjekiGf4pmH74erHyjH4TjxEQOlKqoH9FDVpeqHcEXjByOa03sypevVi1cUTZfE5G0
 3lAB9N5kxWk4EDDmDAGS/oZrjl6sy5jnyTYMkFSpWOtXMxAM+rD5KSZU0LbF0sIcmhck
 bfFA==
X-Gm-Message-State: ANhLgQ3ePRt5WRvkdtRAQQqfX7p/0tq8T3vB+chCebhCMirB+rRWQ1w3
 Swj0/dQPpQT5jGgHumpDdFJw2g==
X-Google-Smtp-Source: ADFU+vuGmYD6phCdUsHfqPvdvdZy5eRRSacLOTZDAtctxiazbLCY/FK9XrjT4LgWQXZdWp4k0GZpoQ==
X-Received: by 2002:a5d:4fce:: with SMTP id h14mr4755176wrw.177.1583060860630; 
 Sun, 01 Mar 2020 03:07:40 -0800 (PST)
Received: from f2.redhat.com (bzq-79-177-42-131.red.bezeqint.net.
 [79.177.42.131])
 by smtp.gmail.com with ESMTPSA id i7sm11563243wma.32.2020.03.01.03.07.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 01 Mar 2020 03:07:39 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] virtio-net: introduce features defined in the spec
Date: Sun,  1 Mar 2020 13:07:30 +0200
Message-Id: <20200301110733.20197-1-yuri.benditovich@daynix.com>
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

Changes from v1:
__virtio -> __le
maximal -> maximum
minor style fixes

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
