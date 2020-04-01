Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2774F19B364
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 18:51:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A443286840;
	Wed,  1 Apr 2020 16:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2z-3eedl9Go4; Wed,  1 Apr 2020 16:51:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C9C3286A72;
	Wed,  1 Apr 2020 16:51:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC088C089F;
	Wed,  1 Apr 2020 16:51:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A293C089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 16:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0488420506
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 16:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BDQdW4X0i1Z1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 16:51:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id F2E1E204AE
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 16:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585759876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gdTaOIE7tD6LkJdCn+pe1n6Y0DWtGxJuzhgJo7to01o=;
 b=Zl+mPrT+wTj1BlFRJjU62IjUeGvXvOvwpELvoGM8zT+W+/cFrx/GhAHcnd8qbXW/tls/2s
 +Nw/vvYqXLVAXchYIywsQcgsst6zgMdaCKefe8mo4tweeRjInODgTZh/oDeKTzylTX8BPW
 gqT/9uzv73dqU5COlt34sCifzJZN+9A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-OLYNo9BqMgihx8erV8O7jg-1; Wed, 01 Apr 2020 12:51:15 -0400
X-MC-Unique: OLYNo9BqMgihx8erV8O7jg-1
Received: by mail-wr1-f72.google.com with SMTP id v17so104016wro.21
 for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Apr 2020 09:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=gdTaOIE7tD6LkJdCn+pe1n6Y0DWtGxJuzhgJo7to01o=;
 b=im0WQuj4LJmatDOz5hBB8SCO7eqTaIxCZfB7P1u6qrHo74Q7nAhHecX/Ul5RFvfleK
 qvSL8o+w1l/egiDwtEoFXWQJGqlsAjPhOkLUdhWlqJtUpE6ifvMVmA/LpbOG1rqm2vjW
 mhI7HhtzzISL7jpZFHTrUS1W+S12xaIpwUKWT69hEDuSgQBBZDRC+BrQWBppaqHtlAcS
 MAmSOISHc29aErRHTgUXN2F5JdKm5OL/45Z6cqfJarvDM1cZXc3AjlwBbbRTPYmZdflo
 UAxm7qMDNBz8NOpVZ66l3JPYOACZkwzZ28PuU6J4pVz0l6w5VENhdtFtTpRnFu5xH/dO
 QJbw==
X-Gm-Message-State: ANhLgQ3jfeyJKM0tvkNWI0/EkIOAhGytXTOuNngRazE+BmIs1Q2cZAAz
 B0ewRAYjRfmsOEkeGwoPPk7TJtIsvu90ePdpRJ/VEPDxKUAq3PmqTqnxHeq4eTl4wTN04ePk3hs
 uB1odRkJ0THvEHqIG/4P4WFVQ982ThkmNRiyJVSzezA==
X-Received: by 2002:a5d:400d:: with SMTP id n13mr26967272wrp.396.1585759873771; 
 Wed, 01 Apr 2020 09:51:13 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvJ0pgx1SXPbI4O/8Day6ptgGE9mSEX0BpL2/jsBTqjtCm3uyzZttDISrsxNqevsV0Dl4mtNQ==
X-Received: by 2002:a5d:400d:: with SMTP id n13mr26967250wrp.396.1585759873521; 
 Wed, 01 Apr 2020 09:51:13 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id z12sm3729253wrt.27.2020.04.01.09.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 09:51:12 -0700 (PDT)
Date: Wed, 1 Apr 2020 12:51:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] virtio/test: fix up after IOTLB changes
Message-ID: <20200401165100.276039-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, netdev@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

QWxsb3cgYnVpbGRpbmcgdnJpbmdoIHdpdGhvdXQgSU9UTEIgKHRoYXQncyB0aGUgY2FzZSBmb3Ig
dXNlcnNwYWNlCmJ1aWxkcywgd2lsbCBiZSB1c2VmdWwgZm9yIENBSUYvVk9EIGRvd24gdGhlIHJv
YWQgdG9vKS4KVXBkYXRlIGZvciBBUEkgdHdlYWtzLgpEb24ndCBpbmNsdWRlIHZyaW5naCB3aXRo
IGtlcm5lbCBidWlsZHMuCgpDYzogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KQ2M6
IEV1Z2VuaW8gUMOpcmV6IDxlcGVyZXptYUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBNaWNo
YWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvdmhvc3QvdGVzdC5j
ICAgfCA0ICsrLS0KIGRyaXZlcnMvdmhvc3QvdnJpbmdoLmMgfCA1ICsrKysrCiBpbmNsdWRlL2xp
bnV4L3ZyaW5naC5oIHwgMiArKwogdG9vbHMvdmlydGlvL01ha2VmaWxlICB8IDMgKystCiA0IGZp
bGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy92aG9zdC90ZXN0LmMgYi9kcml2ZXJzL3Zob3N0L3Rlc3QuYwppbmRleCAzOTRl
MmU1Yzc3MmQuLjlhM2EwOTAwNWUwMyAxMDA2NDQKLS0tIGEvZHJpdmVycy92aG9zdC90ZXN0LmMK
KysrIGIvZHJpdmVycy92aG9zdC90ZXN0LmMKQEAgLTEyMCw3ICsxMjAsNyBAQCBzdGF0aWMgaW50
IHZob3N0X3Rlc3Rfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZikKIAl2
cXNbVkhPU1RfVEVTVF9WUV0gPSAmbi0+dnFzW1ZIT1NUX1RFU1RfVlFdOwogCW4tPnZxc1tWSE9T
VF9URVNUX1ZRXS5oYW5kbGVfa2ljayA9IGhhbmRsZV92cV9raWNrOwogCXZob3N0X2Rldl9pbml0
KGRldiwgdnFzLCBWSE9TVF9URVNUX1ZRX01BWCwgVUlPX01BWElPViwKLQkJICAgICAgIFZIT1NU
X1RFU1RfUEtUX1dFSUdIVCwgVkhPU1RfVEVTVF9XRUlHSFQpOworCQkgICAgICAgVkhPU1RfVEVT
VF9QS1RfV0VJR0hULCBWSE9TVF9URVNUX1dFSUdIVCwgTlVMTCk7CiAKIAlmLT5wcml2YXRlX2Rh
dGEgPSBuOwogCkBAIC0yMjUsNyArMjI1LDcgQEAgc3RhdGljIGxvbmcgdmhvc3RfdGVzdF9yZXNl
dF9vd25lcihzdHJ1Y3Qgdmhvc3RfdGVzdCAqbikKIHsKIAl2b2lkICpwcml2ID0gTlVMTDsKIAls
b25nIGVycjsKLQlzdHJ1Y3Qgdmhvc3RfdW1lbSAqdW1lbTsKKwlzdHJ1Y3Qgdmhvc3RfaW90bGIg
KnVtZW07CiAKIAltdXRleF9sb2NrKCZuLT5kZXYubXV0ZXgpOwogCWVyciA9IHZob3N0X2Rldl9j
aGVja19vd25lcigmbi0+ZGV2KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvdnJpbmdoLmMg
Yi9kcml2ZXJzL3Zob3N0L3ZyaW5naC5jCmluZGV4IGVlMDQ5MWY1NzlhYy4uODc4ZTU2NWRmZmZl
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3Zob3N0L3ZyaW5naC5jCisrKyBiL2RyaXZlcnMvdmhvc3Qv
dnJpbmdoLmMKQEAgLTEzLDkgKzEzLDExIEBACiAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgog
I2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KKyNpZmRl
ZiBWSE9TVF9JT1RMQgogI2luY2x1ZGUgPGxpbnV4L2J2ZWMuaD4KICNpbmNsdWRlIDxsaW51eC9o
aWdobWVtLmg+CiAjaW5jbHVkZSA8bGludXgvdmhvc3RfaW90bGIuaD4KKyNlbmRpZgogI2luY2x1
ZGUgPHVhcGkvbGludXgvdmlydGlvX2NvbmZpZy5oPgogCiBzdGF0aWMgX19wcmludGYoMSwyKSBf
X2NvbGQgdm9pZCB2cmluZ2hfYmFkKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQpAQCAtMTA1OSw2ICsx
MDYxLDggQEAgaW50IHZyaW5naF9uZWVkX25vdGlmeV9rZXJuKHN0cnVjdCB2cmluZ2ggKnZyaCkK
IH0KIEVYUE9SVF9TWU1CT0wodnJpbmdoX25lZWRfbm90aWZ5X2tlcm4pOwogCisjaWZkZWYgVkhP
U1RfSU9UTEIKKwogc3RhdGljIGludCBpb3RsYl90cmFuc2xhdGUoY29uc3Qgc3RydWN0IHZyaW5n
aCAqdnJoLAogCQkJICAgdTY0IGFkZHIsIHU2NCBsZW4sIHN0cnVjdCBiaW9fdmVjIGlvdltdLAog
CQkJICAgaW50IGlvdl9zaXplLCB1MzIgcGVybSkKQEAgLTE0MTYsNSArMTQyMCw2IEBAIGludCB2
cmluZ2hfbmVlZF9ub3RpZnlfaW90bGIoc3RydWN0IHZyaW5naCAqdnJoKQogfQogRVhQT1JUX1NZ
TUJPTCh2cmluZ2hfbmVlZF9ub3RpZnlfaW90bGIpOwogCisjZW5kaWYKIAogTU9EVUxFX0xJQ0VO
U0UoIkdQTCIpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC92cmluZ2guaCBiL2luY2x1ZGUv
bGludXgvdnJpbmdoLmgKaW5kZXggYmQwNTAzY2E2ZjhmLi5lYmZmMTIxYzBiMDIgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvbGludXgvdnJpbmdoLmgKKysrIGIvaW5jbHVkZS9saW51eC92cmluZ2guaApA
QCAtMTQsOCArMTQsMTAgQEAKICNpbmNsdWRlIDxsaW51eC92aXJ0aW9fYnl0ZW9yZGVyLmg+CiAj
aW5jbHVkZSA8bGludXgvdWlvLmg+CiAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgorI2lmZGVmIFZI
T1NUX0lPVExCCiAjaW5jbHVkZSA8bGludXgvZG1hLWRpcmVjdGlvbi5oPgogI2luY2x1ZGUgPGxp
bnV4L3Zob3N0X2lvdGxiLmg+CisjZW5kaWYKICNpbmNsdWRlIDxhc20vYmFycmllci5oPgogCiAv
KiB2aXJ0aW9fcmluZyB3aXRoIGluZm9ybWF0aW9uIG5lZWRlZCBmb3IgaG9zdCBhY2Nlc3MuICov
CmRpZmYgLS1naXQgYS90b29scy92aXJ0aW8vTWFrZWZpbGUgYi90b29scy92aXJ0aW8vTWFrZWZp
bGUKaW5kZXggZjMzZjMyZjFkMjA4Li5kM2YxNTJmNDY2MGIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Zp
cnRpby9NYWtlZmlsZQorKysgYi90b29scy92aXJ0aW8vTWFrZWZpbGUKQEAgLTIyLDcgKzIyLDgg
QEAgT09UX0NPTkZJR1M9XAogCUNPTkZJR19WSE9TVD1tIFwKIAlDT05GSUdfVkhPU1RfTkVUPW4g
XAogCUNPTkZJR19WSE9TVF9TQ1NJPW4gXAotCUNPTkZJR19WSE9TVF9WU09DSz1uCisJQ09ORklH
X1ZIT1NUX1ZTT0NLPW4gXAorCUNPTkZJR19WSE9TVF9SSU5HPW4KIE9PVF9CVUlMRD1LQ0ZMQUdT
PSItSSAiJHtPT1RfVkhPU1R9ICR7TUFLRX0gLUMgJHtPT1RfS1NSQ30gVj0ke1Z9CiBvb3QtYnVp
bGQ6CiAJZWNobyAiVU5TVVBQT1JURUQhIERvbid0IHVzZSB0aGUgcmVzdWx0aW5nIG1vZHVsZXMg
aW4gcHJvZHVjdGlvbiEiCi0tIApNU1QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
