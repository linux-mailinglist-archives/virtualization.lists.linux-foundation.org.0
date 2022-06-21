Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id AB63B55376A
	for <lists.virtualization@lfdr.de>; Tue, 21 Jun 2022 18:09:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8DF960F3F;
	Tue, 21 Jun 2022 16:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8DF960F3F
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RWOrDrpP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G6JgG-ddRAAQ; Tue, 21 Jun 2022 16:09:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9AD0960F41;
	Tue, 21 Jun 2022 16:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AD0960F41
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E680C0083;
	Tue, 21 Jun 2022 16:09:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C700C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jun 2022 16:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 466CE83F8A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jun 2022 16:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 466CE83F8A
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=RWOrDrpP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3wE9R2AtiVbd
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jun 2022 16:09:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9922183F89
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9922183F89
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jun 2022 16:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655827750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+bAhmFC/hjGzAWfV3jJm6JhUFvDtTISGABduARBAGlA=;
 b=RWOrDrpPM9Qnd+PJTWGLp623D36BsZvOGchSPuBkibO29EaORl09xuBC1lctmVd/73tG+u
 fFchkLebG6hnFATbvoC9Wlrjh7QGB7XHT4T+H70pnapF/E+k1O1Rau9zm7Gp1Qo+T7r+tq
 n5LDC9dmxY5EB7G/0MUNQNGeNkGTrnk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-__WqsQ-9PZabVBUt_UD9gA-1; Tue, 21 Jun 2022 12:09:09 -0400
X-MC-Unique: __WqsQ-9PZabVBUt_UD9gA-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay28-20020a05600c1e1c00b0039c5cbe76c1so8641604wmb.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jun 2022 09:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+bAhmFC/hjGzAWfV3jJm6JhUFvDtTISGABduARBAGlA=;
 b=V1myY5/tQVw/sb+lAV4fzaIabUr/XCobl0f6AlLi699FpEl3YwEXhwiU5766vepS1h
 jCbJRoioF2mvTaUg64QbqMerC3mDnvsKzlb0t0C3m3KPCnf1h3MX+mCwtccjEcqM5LyA
 oRow9vEuTuD9fXsgm3XZWmO/2A6fQRbwVlpLZQmXYH9rcr0nuEBIda05IELveQCaUBKM
 coXUSJ2ifNsk2RVu+AsZQiObn9eo24kfpfTtaLhEj5JIH84QUB4kRkKgl7bBRsSjgg7W
 qSpJvXumpMU0mfhSzKrSbgLBwyX2a4hcVP6Q6SS7nl1yZvIGLHVrs21aQeRPiExq7wUb
 425A==
X-Gm-Message-State: AOAM532hQWeYWNCNcOJBycdEZrI74GN0treZlNDhFcj1V5frspJVPVkg
 CKxqklbazeGABrfkYuJx89QauVtmL3SrjLnH7oYAd+Q80js4FKTZGc85006QvAJjPAMTDXHQ3eG
 ZrKT96nSqrpAYRuP1FV7VJ7Bzvv6kDEG/a3lqQX3j0FyTPZg6fkoluGFPgC58VCjFlKrSNhCwX/
 cbh3W+/v1nfmWAWQoOog==
X-Received: by 2002:a05:600c:42c9:b0:39c:3808:5479 with SMTP id
 j9-20020a05600c42c900b0039c38085479mr41301681wme.4.1655827746289; 
 Tue, 21 Jun 2022 09:09:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3l84ij+5Pi9MrXnI7nrsOXu5NGSIn7YSrgA1eUFOkpS4ItURWuYfMpqa4odA2HMkGBOrEKQ==
X-Received: by 2002:a05:600c:42c9:b0:39c:3808:5479 with SMTP id
 j9-20020a05600c42c900b0039c38085479mr41301654wme.4.1655827746039; 
 Tue, 21 Jun 2022 09:09:06 -0700 (PDT)
Received: from step1.redhat.com (host-79-46-200-40.retail.telecomitalia.it.
 [79.46.200.40]) by smtp.gmail.com with ESMTPSA id
 ba7-20020a0560001c0700b0021b903a018bsm6531560wrb.92.2022.06.21.09.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 09:09:05 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH 2/3] vdpa_sim_blk: limit the number of request handled per
 batch
Date: Tue, 21 Jun 2022 18:08:58 +0200
Message-Id: <20220621160859.196646-3-sgarzare@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621160859.196646-1-sgarzare@redhat.com>
References: <20220621160859.196646-1-sgarzare@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

TGltaXQgdGhlIG51bWJlciBvZiByZXF1ZXN0cyAoNCBwZXIgcXVldWUgYXMgZm9yIHZkcGFfc2lt
X25ldCkgaGFuZGxlZAppbiBhIGJhdGNoIHRvIHByZXZlbnQgdGhlIHdvcmtlciBmcm9tIHVzaW5n
IHRoZSBDUFUgZm9yIHRvbyBsb25nLgoKU3VnZ2VzdGVkLWJ5OiBFdWdlbmlvIFDDqXJleiA8ZXBl
cmV6bWFAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogU3RlZmFubyBHYXJ6YXJlbGxhIDxzZ2Fy
emFyZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbV9ibGsu
YyB8IDE1ICsrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9z
aW1fYmxrLmMgYi9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW1fYmxrLmMKaW5kZXggYTgz
YTVjNzZmNjIwLi5hYzg2NDc4ODQ1YjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmRwYS92ZHBhX3Np
bS92ZHBhX3NpbV9ibGsuYworKysgYi9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW1fYmxr
LmMKQEAgLTE5Nyw2ICsxOTcsNyBAQCBzdGF0aWMgYm9vbCB2ZHBhc2ltX2Jsa19oYW5kbGVfcmVx
KHN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltLAogc3RhdGljIHZvaWQgdmRwYXNpbV9ibGtfd29yayhz
dHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiB7CiAJc3RydWN0IHZkcGFzaW0gKnZkcGFzaW0gPSBj
b250YWluZXJfb2Yod29yaywgc3RydWN0IHZkcGFzaW0sIHdvcmspOworCWJvb2wgcmVzY2hlZHVs
ZSA9IGZhbHNlOwogCWludCBpOwogCiAJc3Bpbl9sb2NrKCZ2ZHBhc2ltLT5sb2NrKTsKQEAgLTIw
NiwxMSArMjA3LDE1IEBAIHN0YXRpYyB2b2lkIHZkcGFzaW1fYmxrX3dvcmsoc3RydWN0IHdvcmtf
c3RydWN0ICp3b3JrKQogCiAJZm9yIChpID0gMDsgaSA8IFZEUEFTSU1fQkxLX1ZRX05VTTsgaSsr
KSB7CiAJCXN0cnVjdCB2ZHBhc2ltX3ZpcnRxdWV1ZSAqdnEgPSAmdmRwYXNpbS0+dnFzW2ldOwor
CQlib29sIHZxX3dvcmsgPSB0cnVlOworCQlpbnQgcmVxcyA9IDA7CiAKIAkJaWYgKCF2cS0+cmVh
ZHkpCiAJCQljb250aW51ZTsKIAotCQl3aGlsZSAodmRwYXNpbV9ibGtfaGFuZGxlX3JlcSh2ZHBh
c2ltLCB2cSkpIHsKKwkJd2hpbGUgKHZxX3dvcmspIHsKKwkJCXZxX3dvcmsgPSB2ZHBhc2ltX2Js
a19oYW5kbGVfcmVxKHZkcGFzaW0sIHZxKTsKKwogCQkJLyogTWFrZSBzdXJlIHVzZWQgaXMgdmlz
aWJsZSBiZWZvcmUgcmFzaW5nIHRoZSBpbnRlcnJ1cHQuICovCiAJCQlzbXBfd21iKCk7CiAKQEAg
LTIxOCwxMCArMjIzLDE4IEBAIHN0YXRpYyB2b2lkIHZkcGFzaW1fYmxrX3dvcmsoc3RydWN0IHdv
cmtfc3RydWN0ICp3b3JrKQogCQkJaWYgKHZyaW5naF9uZWVkX25vdGlmeV9pb3RsYigmdnEtPnZy
aW5nKSA+IDApCiAJCQkJdnJpbmdoX25vdGlmeSgmdnEtPnZyaW5nKTsKIAkJCWxvY2FsX2JoX2Vu
YWJsZSgpOworCisJCQlpZiAoKytyZXFzID4gNCkgeworCQkJCXZxX3dvcmsgPSBmYWxzZTsKKwkJ
CQlyZXNjaGVkdWxlID0gdHJ1ZTsKKwkJCX0KIAkJfQogCX0KIG91dDoKIAlzcGluX3VubG9jaygm
dmRwYXNpbS0+bG9jayk7CisKKwlpZiAocmVzY2hlZHVsZSkKKwkJc2NoZWR1bGVfd29yaygmdmRw
YXNpbS0+d29yayk7CiB9CiAKIHN0YXRpYyB2b2lkIHZkcGFzaW1fYmxrX2dldF9jb25maWcoc3Ry
dWN0IHZkcGFzaW0gKnZkcGFzaW0sIHZvaWQgKmNvbmZpZykKLS0gCjIuMzYuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
