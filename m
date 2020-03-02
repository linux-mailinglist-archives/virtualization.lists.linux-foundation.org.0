Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E001759BC
	for <lists.virtualization@lfdr.de>; Mon,  2 Mar 2020 12:52:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 24B118502A;
	Mon,  2 Mar 2020 11:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yu3n8_aXIF8u; Mon,  2 Mar 2020 11:52:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CC96385534;
	Mon,  2 Mar 2020 11:52:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C026EC013E;
	Mon,  2 Mar 2020 11:52:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5B81C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9BAC82042E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aAm0OIp-HzE5
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:51:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id D367C1FD42
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:51:58 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v2so12115372wrp.12
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Mar 2020 03:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=/rHHl6KiQFstCbJm9Q4e8qxVTuasj3sB26DLZAjgwA0=;
 b=flXngT8rwKOxE5BOh/O+vL0l6yqTuAsuCvysZSvRb3FKN8FZWnaXjVnUS/DOjMcn/Y
 4eTchIL2gM+FUZAc6D0uA2Wpvj9M/YpKCRJepV++nwOB8Z2WtM1L2UVvwfrYX7DkVJaK
 sMTSftsb0Qn3ncNHw6VQDYbZgQQKuDsocuv8vfSebWtaiBlmnu4Ixcuj+t9gaxtO4KD+
 69814S+OhRkjFIvJnVVjnXpEVUHqbDboHUd+hTZcpG/NiRTnXwoRU3tpf9uyEOua0/Yg
 tA51r/6uHH4OlcwlTANqoTzuIW2Lnyc1ed0w54wAqmeAvHXsgDEtHRdoG3fA4ya6xzPv
 Mrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/rHHl6KiQFstCbJm9Q4e8qxVTuasj3sB26DLZAjgwA0=;
 b=udciomE0fH61EHCphp1Tfvce4yTpJF2b1fyBzeJ4mRMeWKrODFQtpZ9ITpzaZjUvsN
 hJhbKVS92NN8Dazlb1QEYzDQOKWF5VO3mnlNMhDjCQ1CdBrYIVy3vO77Fpda0A0N4Yzy
 XZUvf3+TdnkKTixS1ztQYPKWpuGSV+5jbHkycHNJOHubBsU/KtVrxiovSi4/4n8Vj7as
 U+TzKZts1XS3qsG7Nnf5taw2AjGCUWK80YzLOZteVq5nF37+KFfudQpKliIq8qCCXYp0
 Pbyx+hUhyoH/XNRJhEhCeBTPxvhOzlG3YUAv+HoxEDJZn85VekrCMNs4VVrDYxq2Jv3O
 8Egw==
X-Gm-Message-State: APjAAAXSfgwJs3Al++t4PH4ZsR+6gToiqSshXRqmtvKXlIpQ6Y2oPuSG
 K66ZTo7pjjJr2NEiaNYC9tkBhA==
X-Google-Smtp-Source: APXvYqzOtVclswSZyIGBO1O3Bre1Sv8RV3Hy5Yj/o+23zB0EGZ5TSdI7NZOfUNuDS4YtUDwvWO9dTw==
X-Received: by 2002:a5d:4fc9:: with SMTP id h9mr21894695wrw.400.1583149917331; 
 Mon, 02 Mar 2020 03:51:57 -0800 (PST)
Received: from f2.redhat.com (bzq-79-177-42-131.red.bezeqint.net.
 [79.177.42.131])
 by smtp.gmail.com with ESMTPSA id f17sm16840364wrj.28.2020.03.02.03.51.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Mar 2020 03:51:56 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] virtio-net: introduce features defined in the spec
Date: Mon,  2 Mar 2020 13:50:00 +0200
Message-Id: <20200302115003.14877-1-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
Cc: yan@daynix.com, virtio-dev@lists.oasis-open.org
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

Changes from v3: reformatted structure in patch 1

Yuri Benditovich (3):
  virtio-net: Introduce extended RSC feature
  virtio-net: Introduce RSS receive steering feature
  virtio-net: Introduce hash report feature

 include/uapi/linux/virtio_net.h | 102 ++++++++++++++++++++++++++++++--
 1 file changed, 98 insertions(+), 4 deletions(-)

-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
