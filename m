Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2CB11E5AA
	for <lists.virtualization@lfdr.de>; Fri, 13 Dec 2019 15:35:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 046608817F;
	Fri, 13 Dec 2019 14:35:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KSDbQPG1w9D2; Fri, 13 Dec 2019 14:35:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D8AA588247;
	Fri, 13 Dec 2019 14:35:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BEBB1C0881;
	Fri, 13 Dec 2019 14:35:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3184C0881
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 14:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A85E1203D3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 14:35:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VZldkuB+w7SD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 14:35:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id B566D20013
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 14:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576247730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1UCRXBD5Pi3Dg28VGjijNWgSndqA5ZG4/4ICsiAgUB8=;
 b=TpS1h5d7WXg4r9T2miPjYq36zjAa1dnT6QfPkm+Nh60DxUi9vmtgJMl2j+5ukauQZ+IrQX
 q9hMs63AtWovXYmCQcV2x3vujDT98U0ar1Syl6NcsFOk1PlIzvQgcojtxUUHljQm3Tr1Mk
 GI1pwlh8u2RUxwmQav/joMm5Z+WJLyk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-MHB55A6-OgKYdxPbgruYBA-1; Fri, 13 Dec 2019 09:35:26 -0500
Received: by mail-qt1-f197.google.com with SMTP id e8so1915065qtg.9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 06:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=K16O3uoMoq1X7RVCymy3uF4s1barxs0V/Dkj4PdUFYc=;
 b=nx2lppcALpwmn5jqgqLxhE2tKkXkiT8QluiNavHOzKsBJW2cNJr/ObejuYlyWUzpRv
 TIe6uaWLgbT24X1ITvr+ii4gSaamB1rNg/XaGXu8LKMwZHYyTpm9ezdFJuYVg7EhQren
 H6M3unEaUzQWJ4NUIsqmAUgj8eRGyEZh5UWt64t1arlBnOtKhuPxnXPjwkWajz6VGrjN
 0a3LxXdDne9bdsNCqcMK/vUhSLpu5G36ZGHfOOtz75BoTf4c7+zf0Jbor9G3dM1n8wsC
 eS+14VQKNhR+nKzguvfBbGYZQOuv29Cv9ER1lM+Rz+zvCXu76njGmr2LLSx0Bnd0s79d
 GmsQ==
X-Gm-Message-State: APjAAAViAAH35Rs4EV6s0tPndzZGBu/23yBZQtAdZvGY4VaYZP/E96od
 cmzZLrECEkrjECooeWuxdEq5mMgVdDxymSRpJHwneoFAYbvbyaFW0DCueL7953m756e98XQHUBw
 NgoL1PZVPpYMu/NYLno11BcHbLG9GrhAgGS5n5NIupg==
X-Received: by 2002:a37:5d1:: with SMTP id 200mr13575573qkf.492.1576247725619; 
 Fri, 13 Dec 2019 06:35:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqxgq1bbRToA9P95foPk8oGS2OI8ibHY6a72vmEjljgya2qgJqTa4/Xh04URKGN+H8Bz4Y3K4g==
X-Received: by 2002:a37:5d1:: with SMTP id 200mr13575555qkf.492.1576247725393; 
 Fri, 13 Dec 2019 06:35:25 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id l62sm2885132qke.12.2019.12.13.06.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 06:35:24 -0800 (PST)
Date: Fri, 13 Dec 2019 09:35:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] virtio: cleanups and fixes
Message-ID: <20191213093519-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Mutt-Fcc: =sent
X-MC-Unique: MHB55A6-OgKYdxPbgruYBA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: yuhuang@redhat.com, kvm@vger.kernel.org, netdev@vger.kernel.org,
 mst@redhat.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org, imammedo@redhat.com,
 akpm@linux-foundation.org, liuj97@gmail.com
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

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to 63b9b80e9f5b2c463d98d6e550e0d0e3ace66033:

  virtio_balloon: divide/multiply instead of shifts (2019-12-11 08:14:07 -0500)

----------------------------------------------------------------
virtio: fixes, cleanups

Some fixes and cleanup patches.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
David Hildenbrand (1):
      virtio-balloon: fix managed page counts when migrating pages between zones

Michael S. Tsirkin (2):
      virtio_balloon: name cleanups
      virtio_balloon: divide/multiply instead of shifts

 drivers/virtio/virtio_balloon.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
