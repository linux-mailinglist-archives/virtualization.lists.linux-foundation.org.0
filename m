Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 845EF206FB4
	for <lists.virtualization@lfdr.de>; Wed, 24 Jun 2020 11:08:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 308A9880E9;
	Wed, 24 Jun 2020 09:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YR4ZyKOxZClS; Wed, 24 Jun 2020 09:08:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6B6148815C;
	Wed, 24 Jun 2020 09:08:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4108EC016F;
	Wed, 24 Jun 2020 09:08:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18ACEC016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 09:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 049E0880E9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 09:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EncltKjhDeSc
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 09:08:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A7FF8861E7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 09:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592989687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VQoY+UTRP06W0gqpd2Juj7Hxof1/RYyQfXylaOH8G2E=;
 b=F8NLBw5tN6xoouLxkIAmkOlqr/gTHC94CEHbImfOM3BtLo8y9a30kna/RJLZh8V9D0PoGk
 YTB4D8EuRUl/NyUSJIDMmMNSXf0tXjixbnYl741kCOjUhW1u3BjcyhOJjI0lvRvJBkm8oB
 zFnUGAGN/X4oSy2Lfb5IiFN/nHmLWXM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-cy-JHhttNrmmIQQqUtTxJQ-1; Wed, 24 Jun 2020 05:08:06 -0400
X-MC-Unique: cy-JHhttNrmmIQQqUtTxJQ-1
Received: by mail-wm1-f72.google.com with SMTP id t145so2150130wmt.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 02:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=VQoY+UTRP06W0gqpd2Juj7Hxof1/RYyQfXylaOH8G2E=;
 b=A8mCcYFRKU+vW4dWs4d7bVtYkRcMpfO1sCpWcv1OZT9dPgBU8xk4Ru1rUzLfLWxAKE
 7Mi1GxaSK0vvJn82czRakXRi7VBpmTpudwacO5DhhRTy7kTOOUE6ouKE1lWlbFwDq5YZ
 2ZY9slJpJYSNqQu7rO72GYfXmyWq9atmpSTCwNjPJzVq4dvx2QuJXDY4zAJyjrOLqDr6
 G60Mrcvn7VTFhVkgQ+Zt84+vuCCh6pb83W6duT2ScAj8y9SWbDkMDPl/rPHisPTpcgm2
 IYXG9sM8RcOOpFgYrvjEgXUkQN67I6tJLB/jGSBjWhN92l9Af1SauzxN9aKQx9YN7nPl
 ZC9g==
X-Gm-Message-State: AOAM533+RdZAQULNwMTYVqbAOYmcQNA5ggQKtvhyuW6goRDTbM/9W31W
 F9laTXU1pnKt+7vr31xWk/R5cQ2B+4mFHl65NABwMo5El2w+FLFzffzS2oa1ld6B3VQa0jIORSG
 I5og24VwA9o/W6UEOrmLiNmYxDoHgB1nuVdjwkHUEWw==
X-Received: by 2002:a7b:cb4c:: with SMTP id v12mr28392154wmj.43.1592989684867; 
 Wed, 24 Jun 2020 02:08:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbEhEN966Il4umYMTMjRrrueqoGcM5lQiV/3BTRS9Bm+7+N7X0YZSdV011xkOJs+ZR2fNnFw==
X-Received: by 2002:a7b:cb4c:: with SMTP id v12mr28392130wmj.43.1592989684670; 
 Wed, 24 Jun 2020 02:08:04 -0700 (PDT)
Received: from redhat.com ([82.166.20.53])
 by smtp.gmail.com with ESMTPSA id e5sm26714788wrw.19.2020.06.24.02.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 02:08:03 -0700 (PDT)
Date: Wed, 24 Jun 2020 05:08:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] virtio: fixes, tests
Message-ID: <20200624050801-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: pankaj.gupta.linux@gmail.com, kvm@vger.kernel.org, netdev@vger.kernel.org,
 mst@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 teawaterz@linux.alibaba.com, dan.carpenter@oracle.com
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA0ODc3ODQ2NGJiN2QzNDZiNDcxNTdk
MjFmZmRlMmFmNmIyZDM5MTEwOgoKICBMaW51eCA1LjgtcmMyICgyMDIwLTA2LTIxIDE1OjQ1OjI5
IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L21zdC92aG9zdC5naXQg
dGFncy9mb3JfbGludXMKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBjYjkxOTA5ZTQ4
YTQ4MDkyNjFlZjRlOTY3NDY0ZTIwMDliMjE0ZjA2OgoKICB0b29scy92aXJ0aW86IFVzZSB0b29s
cy9pbmNsdWRlL2xpc3QuaCBpbnN0ZWFkIG9mIHN0dWJzICgyMDIwLTA2LTIyIDEyOjM0OjIyIC0w
NDAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQp2aXJ0aW86IGZpeGVzLCB0ZXN0cwoKRml4ZXMgYWxsIG92ZXIgdGhlIHBs
YWNlLgoKVGhpcyBpbmNsdWRlcyBhIGNvdXBsZSBvZiB0ZXN0cyB0aGF0IEkgd291bGQgbm9ybWFs
bHkgZGVmZXIsCmJ1dCBzaW5jZSB0aGV5IGhhdmUgYWxyZWFkeSBiZWVuIGhlbHBmdWwgaW4gY2F0
Y2hpbmcgc29tZSBidWdzLApkb24ndCBidWlsZCBmb3IgYW55IHVzZXJzIGF0IGFsbCwgYW5kIGhh
dmluZyB0aGVtCnVwc3RyZWFtIG1ha2VzIGxpZmUgZWFzaWVyIGZvciBldmVyeW9uZSwgSSB0aGlu
ayBpdCdzCm9rIGV2ZW4gYXQgdGhpcyBsYXRlIHN0YWdlLgoKU2lnbmVkLW9mZi1ieTogTWljaGFl
bCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KRGFuIENhcnBlbnRlciAoMik6
CiAgICAgIHZob3N0X3ZkcGE6IEZpeCBwb3RlbnRpYWwgdW5kZXJmbG93IGluIHZob3N0X3ZkcGFf
bW1hcCgpCiAgICAgIHZpcnRpby1tZW06IHNpbGVuY2UgYSBzdGF0aWMgY2hlY2tlciB3YXJuaW5n
CgpEYXZpZCBIaWxkZW5icmFuZCAoMSk6CiAgICAgIHZpcnRpby1tZW06IGFkZCBtZW1vcnkgdmlh
IGFkZF9tZW1vcnlfZHJpdmVyX21hbmFnZWQoKQoKRXVnZW5pbyBQw6lyZXogKDcpOgogICAgICB0
b29scy92aXJ0aW86IEFkZCAtLWJhdGNoIG9wdGlvbgogICAgICB0b29scy92aXJ0aW86IEFkZCAt
LWJhdGNoPXJhbmRvbSBvcHRpb24KICAgICAgdG9vbHMvdmlydGlvOiBBZGQgLS1yZXNldAogICAg
ICB0b29scy92aXJ0aW86IFVzZSBfX3ZyaW5nX25ld192aXJ0cXVldWUgaW4gdmlydGlvX3Rlc3Qu
YwogICAgICB0b29scy92aXJ0aW86IEV4dHJhY3QgdmlydHF1ZXVlIGluaXRpYWxpemF0aW9uIGlu
IHZxX3Jlc2V0CiAgICAgIHRvb2xzL3ZpcnRpbzogUmVzZXQgaW5kZXggaW4gdmlydGlvX3Rlc3Qg
LS1yZXNldC4KICAgICAgdG9vbHMvdmlydGlvOiBVc2UgdG9vbHMvaW5jbHVkZS9saXN0LmggaW5z
dGVhZCBvZiBzdHVicwoKSmFzb24gV2FuZyAoMSk6CiAgICAgIHZkcGE6IGZpeCB0eXBvcyBpbiB0
aGUgY29tbWVudHMgZm9yIF9fdmRwYV9hbGxvY19kZXZpY2UoKQoKIGRyaXZlcnMvdmRwYS92ZHBh
LmMgICAgICAgICB8ICAgMiArLQogZHJpdmVycy92aG9zdC90ZXN0LmMgICAgICAgIHwgIDU3ICsr
KysrKysrKysrKysrKysrKwogZHJpdmVycy92aG9zdC90ZXN0LmggICAgICAgIHwgICAxICsKIGRy
aXZlcnMvdmhvc3QvdmRwYS5jICAgICAgICB8ICAgMiArLQogZHJpdmVycy92aXJ0aW8vdmlydGlv
X21lbS5jIHwgIDI3ICsrKysrKystLQogdG9vbHMvdmlydGlvL2xpbnV4L2tlcm5lbC5oIHwgICA3
ICstLQogdG9vbHMvdmlydGlvL2xpbnV4L3ZpcnRpby5oIHwgICA1ICstCiB0b29scy92aXJ0aW8v
dmlydGlvX3Rlc3QuYyAgfCAxMzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0KIHRvb2xzL3ZpcnRpby92cmluZ2hfdGVzdC5jICB8ICAgMiArCiA5IGZpbGVzIGNo
YW5nZWQsIDIwNyBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
