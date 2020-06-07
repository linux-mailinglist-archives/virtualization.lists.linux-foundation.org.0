Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA631F0BAA
	for <lists.virtualization@lfdr.de>; Sun,  7 Jun 2020 16:11:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1E12C855A1;
	Sun,  7 Jun 2020 14:11:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IqeUZ8B13Q80; Sun,  7 Jun 2020 14:11:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 85B0D85650;
	Sun,  7 Jun 2020 14:11:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6EDD2C0892;
	Sun,  7 Jun 2020 14:11:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6389C016F
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E283D869CA
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bb5NTuPWzDMt
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 234A4869D7
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591539094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iYrqJxiCF6JLs18Hde8abAzaxAcz1G1OwYlHg0/kUqs=;
 b=FL25yk1VzZQYTRUPSGIFnsxpiqFuPcv97Fu1rG2M44JsMwLYC8dbKWJ2LddnUHep8HUSwy
 UBGBQ3dUZQ96E1Ret7ZdZk6CvVHQ4I5X9oA8Mqt5OJJZ3CeF9x1fiy5wPODqiJn0AZ9fUE
 16595mFVFIYb7G0s9x4Nd29+9nYCOm4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-2puy5fiFOnOYQQXuo7eTKQ-1; Sun, 07 Jun 2020 10:11:31 -0400
X-MC-Unique: 2puy5fiFOnOYQQXuo7eTKQ-1
Received: by mail-wm1-f69.google.com with SMTP id q7so3383279wmj.9
 for <virtualization@lists.linux-foundation.org>;
 Sun, 07 Jun 2020 07:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iYrqJxiCF6JLs18Hde8abAzaxAcz1G1OwYlHg0/kUqs=;
 b=jXyG+rrpPKcL20h/tvgdmtZztvy/su5nWFaUb0HZnhmyRuZla6Wkpsn+2E3BTylmlD
 y2SjnIJLOX5ihgrFCDeEChNKAoOGeDgxbPCQZQz8Aq91XHUoBPH70QXksOyrs7vrCWDC
 bSEA9AyMtjzjv4sBs8i/EsjgotzkvRSBn7R3sP/sMSLIw0kOivcmHuPlFePnnhoLolf2
 Uy0CH9/7YKb4rJ2mNi8J4Tb7GMPp0aIiB6bHh5aSGTPN15aST2gA+kIN/FMonZstI97P
 PkNrZLorO8UfC5BRk0qSrXGljwoTHh2wtBpIY0YGcvLfEjrPEHvIY91zgvBfEWaTOflB
 i9JQ==
X-Gm-Message-State: AOAM531oNue+J86AaNko9Fp9hswQD09mF7J6scO5tbzcZmXkIGF6UbKe
 2bR+Rnb6sLPvND3HswjaeHoYOOFlZho5HEaePbdzmbxkBUH+x4jCYCy8p50Mwzo00yAYkQFAoo9
 mqtMF56N57oPg3hEblaGRHMuvhZEdPtKMmq7igegZAw==
X-Received: by 2002:adf:eacc:: with SMTP id o12mr19622999wrn.139.1591539090625; 
 Sun, 07 Jun 2020 07:11:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfd2gP3crUhrnMObq7YNTh1ror2xnNGnauOq/HrdRRvHGMKoTNmmtC928LfI9zGfAJy7zCWQ==
X-Received: by 2002:adf:eacc:: with SMTP id o12mr19622983wrn.139.1591539090400; 
 Sun, 07 Jun 2020 07:11:30 -0700 (PDT)
Received: from redhat.com (bzq-82-81-31-23.red.bezeqint.net. [82.81.31.23])
 by smtp.gmail.com with ESMTPSA id c81sm20250743wmd.42.2020.06.07.07.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 07:11:29 -0700 (PDT)
Date: Sun, 7 Jun 2020 10:11:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v5 03/13] vhost: batching fetches
Message-ID: <20200607141057.704085-4-mst@redhat.com>
References: <20200607141057.704085-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200607141057.704085-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, eperezma@redhat.com, kvm@vger.kernel.org,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

V2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQsIG5ldyBhbmQgb2xkIGNvZGUgcGVyZm9ybSBpZGVudGlj
YWxseS4KCkxvdHMgb2YgZXh0cmEgb3B0aW1pemF0aW9ucyBhcmUgbm93IHBvc3NpYmxlLCBlLmcu
CndlIGNhbiBmZXRjaCBtdWx0aXBsZSBoZWFkcyB3aXRoIGNvcHlfZnJvbS90b191c2VyIG5vdy4K
V2UgY2FuIGdldCByaWQgb2YgbWFpbnRhaW5pbmcgdGhlIGxvZyBhcnJheS4gIEV0YyBldGMuCgpT
aWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgpTaWduZWQt
b2ZmLWJ5OiBFdWdlbmlvIFDDqXJleiA8ZXBlcmV6bWFAcmVkaGF0LmNvbT4KTGluazogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIwMDQwMTE4MzExOC44MzM0LTQtZXBlcmV6bWFAcmVkaGF0
LmNvbQpTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgot
LS0KIGRyaXZlcnMvdmhvc3QvdGVzdC5jICB8ICAyICstCiBkcml2ZXJzL3Zob3N0L3Zob3N0LmMg
fCA0NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCiBkcml2ZXJz
L3Zob3N0L3Zob3N0LmggfCAgMyArKysKIDMgZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3Rlc3QuYyBiL2Ry
aXZlcnMvdmhvc3QvdGVzdC5jCmluZGV4IDlhM2EwOTAwNWUwMy4uMDI4MDZkNmY4NGVmIDEwMDY0
NAotLS0gYS9kcml2ZXJzL3Zob3N0L3Rlc3QuYworKysgYi9kcml2ZXJzL3Zob3N0L3Rlc3QuYwpA
QCAtMTE5LDcgKzExOSw3IEBAIHN0YXRpYyBpbnQgdmhvc3RfdGVzdF9vcGVuKHN0cnVjdCBpbm9k
ZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmKQogCWRldiA9ICZuLT5kZXY7CiAJdnFzW1ZIT1NUX1RF
U1RfVlFdID0gJm4tPnZxc1tWSE9TVF9URVNUX1ZRXTsKIAluLT52cXNbVkhPU1RfVEVTVF9WUV0u
aGFuZGxlX2tpY2sgPSBoYW5kbGVfdnFfa2ljazsKLQl2aG9zdF9kZXZfaW5pdChkZXYsIHZxcywg
VkhPU1RfVEVTVF9WUV9NQVgsIFVJT19NQVhJT1YsCisJdmhvc3RfZGV2X2luaXQoZGV2LCB2cXMs
IFZIT1NUX1RFU1RfVlFfTUFYLCBVSU9fTUFYSU9WICsgNjQsCiAJCSAgICAgICBWSE9TVF9URVNU
X1BLVF9XRUlHSFQsIFZIT1NUX1RFU1RfV0VJR0hULCBOVUxMKTsKIAogCWYtPnByaXZhdGVfZGF0
YSA9IG47CmRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmMgYi9kcml2ZXJzL3Zob3N0
L3Zob3N0LmMKaW5kZXggMzNhNzJlZGIzY2NkLi4zYjA2MDk4MDEzODEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvdmhvc3Qvdmhvc3QuYworKysgYi9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKQEAgLTMwNCw2
ICszMDQsNyBAQCBzdGF0aWMgdm9pZCB2aG9zdF92cV9yZXNldChzdHJ1Y3Qgdmhvc3RfZGV2ICpk
ZXYsCiB7CiAJdnEtPm51bSA9IDE7CiAJdnEtPm5kZXNjcyA9IDA7CisJdnEtPmZpcnN0X2Rlc2Mg
PSAwOwogCXZxLT5kZXNjID0gTlVMTDsKIAl2cS0+YXZhaWwgPSBOVUxMOwogCXZxLT51c2VkID0g
TlVMTDsKQEAgLTM3Miw2ICszNzMsMTEgQEAgc3RhdGljIGludCB2aG9zdF93b3JrZXIodm9pZCAq
ZGF0YSkKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCB2aG9zdF92cV9udW1fYmF0Y2hfZGVz
Y3Moc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEpCit7CisJcmV0dXJuIHZxLT5tYXhfZGVzY3Mg
LSBVSU9fTUFYSU9WOworfQorCiBzdGF0aWMgdm9pZCB2aG9zdF92cV9mcmVlX2lvdmVjcyhzdHJ1
Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkKIHsKIAlrZnJlZSh2cS0+ZGVzY3MpOwpAQCAtMzk0LDYg
KzQwMCw5IEBAIHN0YXRpYyBsb25nIHZob3N0X2Rldl9hbGxvY19pb3ZlY3Moc3RydWN0IHZob3N0
X2RldiAqZGV2KQogCWZvciAoaSA9IDA7IGkgPCBkZXYtPm52cXM7ICsraSkgewogCQl2cSA9IGRl
di0+dnFzW2ldOwogCQl2cS0+bWF4X2Rlc2NzID0gZGV2LT5pb3ZfbGltaXQ7CisJCWlmICh2aG9z
dF92cV9udW1fYmF0Y2hfZGVzY3ModnEpIDwgMCkgeworCQkJcmV0dXJuIC1FSU5WQUw7CisJCX0K
IAkJdnEtPmRlc2NzID0ga21hbGxvY19hcnJheSh2cS0+bWF4X2Rlc2NzLAogCQkJCQkgIHNpemVv
ZigqdnEtPmRlc2NzKSwKIAkJCQkJICBHRlBfS0VSTkVMKTsKQEAgLTE2MTAsNiArMTYxOSw3IEBA
IGxvbmcgdmhvc3RfdnJpbmdfaW9jdGwoc3RydWN0IHZob3N0X2RldiAqZCwgdW5zaWduZWQgaW50
IGlvY3RsLCB2b2lkIF9fdXNlciAqYXJnCiAJCXZxLT5sYXN0X2F2YWlsX2lkeCA9IHMubnVtOwog
CQkvKiBGb3JnZXQgdGhlIGNhY2hlZCBpbmRleCB2YWx1ZS4gKi8KIAkJdnEtPmF2YWlsX2lkeCA9
IHZxLT5sYXN0X2F2YWlsX2lkeDsKKwkJdnEtPm5kZXNjcyA9IHZxLT5maXJzdF9kZXNjID0gMDsK
IAkJYnJlYWs7CiAJY2FzZSBWSE9TVF9HRVRfVlJJTkdfQkFTRToKIAkJcy5pbmRleCA9IGlkeDsK
QEAgLTIxNzksNyArMjE4OSw3IEBAIHN0YXRpYyBpbnQgZmV0Y2hfaW5kaXJlY3RfZGVzY3Moc3Ry
dWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEsCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgZmV0
Y2hfZGVzY3Moc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEpCitzdGF0aWMgaW50IGZldGNoX2J1
ZihzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkKIHsKIAl1bnNpZ25lZCBpbnQgaSwgaGVhZCwg
Zm91bmQgPSAwOwogCXN0cnVjdCB2aG9zdF9kZXNjICpsYXN0OwpAQCAtMjE5Miw3ICsyMjAyLDEx
IEBAIHN0YXRpYyBpbnQgZmV0Y2hfZGVzY3Moc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEpCiAJ
LyogQ2hlY2sgaXQgaXNuJ3QgZG9pbmcgdmVyeSBzdHJhbmdlIHRoaW5ncyB3aXRoIGRlc2NyaXB0
b3IgbnVtYmVycy4gKi8KIAlsYXN0X2F2YWlsX2lkeCA9IHZxLT5sYXN0X2F2YWlsX2lkeDsKIAot
CWlmICh2cS0+YXZhaWxfaWR4ID09IHZxLT5sYXN0X2F2YWlsX2lkeCkgeworCWlmICh1bmxpa2Vs
eSh2cS0+YXZhaWxfaWR4ID09IHZxLT5sYXN0X2F2YWlsX2lkeCkpIHsKKwkJLyogSWYgd2UgYWxy
ZWFkeSBoYXZlIHdvcmsgdG8gZG8sIGRvbid0IGJvdGhlciByZS1jaGVja2luZy4gKi8KKwkJaWYg
KGxpa2VseSh2cS0+bmRlc2NzKSkKKwkJCXJldHVybiB2cS0+bnVtOworCiAJCWlmICh1bmxpa2Vs
eSh2aG9zdF9nZXRfYXZhaWxfaWR4KHZxLCAmYXZhaWxfaWR4KSkpIHsKIAkJCXZxX2Vycih2cSwg
IkZhaWxlZCB0byBhY2Nlc3MgYXZhaWwgaWR4IGF0ICVwXG4iLAogCQkJCSZ2cS0+YXZhaWwtPmlk
eCk7CkBAIC0yMjgzLDYgKzIyOTcsMjQgQEAgc3RhdGljIGludCBmZXRjaF9kZXNjcyhzdHJ1Y3Qg
dmhvc3RfdmlydHF1ZXVlICp2cSkKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBmZXRjaF9k
ZXNjcyhzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkKK3sKKwlpbnQgcmV0ID0gMDsKKworCWlm
ICh1bmxpa2VseSh2cS0+Zmlyc3RfZGVzYyA+PSB2cS0+bmRlc2NzKSkgeworCQl2cS0+Zmlyc3Rf
ZGVzYyA9IDA7CisJCXZxLT5uZGVzY3MgPSAwOworCX0KKworCWlmICh2cS0+bmRlc2NzKQorCQly
ZXR1cm4gMDsKKworCXdoaWxlICghcmV0ICYmIHZxLT5uZGVzY3MgPD0gdmhvc3RfdnFfbnVtX2Jh
dGNoX2Rlc2NzKHZxKSkKKwkJcmV0ID0gZmV0Y2hfYnVmKHZxKTsKKworCXJldHVybiB2cS0+bmRl
c2NzID8gMCA6IHJldDsKK30KKwogLyogVGhpcyBsb29rcyBpbiB0aGUgdmlydHF1ZXVlIGFuZCBm
b3IgdGhlIGZpcnN0IGF2YWlsYWJsZSBidWZmZXIsIGFuZCBjb252ZXJ0cwogICogaXQgdG8gYW4g
aW92ZWMgZm9yIGNvbnZlbmllbnQgYWNjZXNzLiAgU2luY2UgZGVzY3JpcHRvcnMgY29uc2lzdCBv
ZiBzb21lCiAgKiBudW1iZXIgb2Ygb3V0cHV0IHRoZW4gc29tZSBudW1iZXIgb2YgaW5wdXQgZGVz
Y3JpcHRvcnMsIGl0J3MgYWN0dWFsbHkgdHdvCkBAIC0yMzA4LDcgKzIzNDAsNyBAQCBpbnQgdmhv
c3RfZ2V0X3ZxX2Rlc2Moc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEsCiAJaWYgKHVubGlrZWx5
KGxvZykpCiAJCSpsb2dfbnVtID0gMDsKIAotCWZvciAoaSA9IDA7IGkgPCB2cS0+bmRlc2NzOyAr
K2kpIHsKKwlmb3IgKGkgPSB2cS0+Zmlyc3RfZGVzYzsgaSA8IHZxLT5uZGVzY3M7ICsraSkgewog
CQl1bnNpZ25lZCBpb3ZfY291bnQgPSAqaW5fbnVtICsgKm91dF9udW07CiAJCXN0cnVjdCB2aG9z
dF9kZXNjICpkZXNjID0gJnZxLT5kZXNjc1tpXTsKIAkJaW50IGFjY2VzczsKQEAgLTIzNTQsMTQg
KzIzODYsMTkgQEAgaW50IHZob3N0X2dldF92cV9kZXNjKHN0cnVjdCB2aG9zdF92aXJ0cXVldWUg
KnZxLAogCQl9CiAKIAkJcmV0ID0gZGVzYy0+aWQ7CisKKwkJaWYgKCEoZGVzYy0+ZmxhZ3MgJiBW
UklOR19ERVNDX0ZfTkVYVCkpCisJCQlicmVhazsKIAl9CiAKLQl2cS0+bmRlc2NzID0gMDsKKwl2
cS0+Zmlyc3RfZGVzYyA9IGkgKyAxOwogCiAJcmV0dXJuIHJldDsKIAogZXJyOgotCXZob3N0X2Rp
c2NhcmRfdnFfZGVzYyh2cSwgMSk7CisJZm9yIChpID0gdnEtPmZpcnN0X2Rlc2M7IGkgPCB2cS0+
bmRlc2NzOyArK2kpCisJCWlmICghKHZxLT5kZXNjc1tpXS5mbGFncyAmIFZSSU5HX0RFU0NfRl9O
RVhUKSkKKwkJCXZob3N0X2Rpc2NhcmRfdnFfZGVzYyh2cSwgMSk7CiAJdnEtPm5kZXNjcyA9IDA7
CiAKIAlyZXR1cm4gcmV0OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92aG9zdC5oIGIvZHJp
dmVycy92aG9zdC92aG9zdC5oCmluZGV4IDhhN2I0MTkxYmM0OC4uZmVkMzZhZjVjNDQ0IDEwMDY0
NAotLS0gYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmgKKysrIGIvZHJpdmVycy92aG9zdC92aG9zdC5o
CkBAIC04MSw2ICs4MSw3IEBAIHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgewogCiAJc3RydWN0IHZo
b3N0X2Rlc2MgKmRlc2NzOwogCWludCBuZGVzY3M7CisJaW50IGZpcnN0X2Rlc2M7CiAJaW50IG1h
eF9kZXNjczsKIAogCXN0cnVjdCBmaWxlICpraWNrOwpAQCAtMjU3LDYgKzI1OCw4IEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCB2aG9zdF92cV9zZXRfYmFja2VuZChzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVl
ICp2cSwKIAkJCQkJdm9pZCAqcHJpdmF0ZV9kYXRhKQogewogCXZxLT5wcml2YXRlX2RhdGEgPSBw
cml2YXRlX2RhdGE7CisJdnEtPm5kZXNjcyA9IDA7CisJdnEtPmZpcnN0X2Rlc2MgPSAwOwogfQog
CiAvKioKLS0gCk1TVAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
