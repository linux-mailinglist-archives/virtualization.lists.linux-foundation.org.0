Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B6A19C17B
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 14:54:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BAF12204CF;
	Thu,  2 Apr 2020 12:54:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hiWdziN0dgsY; Thu,  2 Apr 2020 12:54:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2D7E320400;
	Thu,  2 Apr 2020 12:54:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17647C07FF;
	Thu,  2 Apr 2020 12:54:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06184C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 12:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E3C94888A5
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 12:54:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CCaaDAmNPwBz
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 12:54:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 21CAC85CB8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 12:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585832046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+rpGY/lQzxU62GHHMv3q/FRvIYAGToP29ghNExNLYc=;
 b=RnfgyI9+oyMc3AuIbdtm6rrOc3vRp8y16aj+7KDdObR1zzjbELDemQJmQ9nBAXDh0CqtV7
 YshEO7NY2ybY+RRJA+t7j8A5HewgLXpKDX1h6aH+CcXS7hVnEpPdSw4jB21r8h0vX4Qdif
 AFFzVnrGAy8DXyTnyC1hpHpujER3UUw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-sGkddGIZP4CS6BgUCWEVfw-1; Thu, 02 Apr 2020 08:54:05 -0400
X-MC-Unique: sGkddGIZP4CS6BgUCWEVfw-1
Received: by mail-qt1-f200.google.com with SMTP id n89so3021790qte.15
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Apr 2020 05:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=e+rpGY/lQzxU62GHHMv3q/FRvIYAGToP29ghNExNLYc=;
 b=b5sN05/ck5Qn7gBdCB7vexI38sG6+zti2fJjBYZ/zlwwUUI/WSbZSbKCVrr0u1cVta
 PsQbjhtHDh0ROF+knIWuDZKS4z1YPqthN/fQDjI5c8tbGch8e1iP4GN5riroZ+eB8N3Z
 JYlt/JSFEee1wUpMKxlZpzu85VO0aVjIwvLKm4JXuhbMqoY4HwfjKt8B1UGilLmwkEHg
 uLoRMfPO0yY/y5JSt5mSECaiUvRavwUCiNaFyQywdKRX5l+ruWIco00iLkdA0vBSZfSY
 n9CUSfs5XqEx9qlk++2MfsFi37nYlVCqblFjj8iEBK6QDFnhkz2wglHCWb20An0xoGkK
 en9Q==
X-Gm-Message-State: AGi0PuYRemDxPIlmJYdkf/sWmZtoLGuXDilKVsC/J54gH2GMM735nStr
 cNKaJqkenagEexkRa3vyIX7AXr3lXPFdTqW/vb0lSQ7dREti7HNWupCG273kQt/Up6ec0PzlL5q
 IJ+mcnaPEqFOm65izkN7g9o1UvZs1XHd2SIdujoBcAg==
X-Received: by 2002:a37:b17:: with SMTP id 23mr3444708qkl.326.1585832044800;
 Thu, 02 Apr 2020 05:54:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypKWAXrSE3QY71rFZEVKPyM9P23H/+nJyT2FOKqzUpxwU6y4/YNd29YMt69nqsRb7v9SGkCigg==
X-Received: by 2002:a37:b17:: with SMTP id 23mr3444679qkl.326.1585832044434;
 Thu, 02 Apr 2020 05:54:04 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id m27sm3713948qtf.80.2020.04.02.05.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 05:54:03 -0700 (PDT)
Date: Thu, 2 Apr 2020 08:53:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] virtio/test: fix up after IOTLB changes
Message-ID: <20200402084021-mutt-send-email-mst@kernel.org>
References: <20200401165100.276039-1-mst@redhat.com>
 <921fe999-e183-058d-722a-1a6a6ab066e0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <921fe999-e183-058d-722a-1a6a6ab066e0@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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

T24gVGh1LCBBcHIgMDIsIDIwMjAgYXQgMTI6MDE6NTZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzQvMiDkuIrljYgxMjo1MSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gQWxsb3cgYnVpbGRpbmcgdnJpbmdoIHdpdGhvdXQgSU9UTEIgKHRoYXQncyB0aGUgY2Fz
ZSBmb3IgdXNlcnNwYWNlCj4gPiBidWlsZHMsIHdpbGwgYmUgdXNlZnVsIGZvciBDQUlGL1ZPRCBk
b3duIHRoZSByb2FkIHRvbykuCj4gPiBVcGRhdGUgZm9yIEFQSSB0d2Vha3MuCj4gPiBEb24ndCBp
bmNsdWRlIHZyaW5naCB3aXRoIGtlcm5lbCBidWlsZHMuCj4gCj4gCj4gSSdtIG5vdCBxdWl0ZSBz
dXJlIHdlIG5lZWQgdGhpcy4KPiAKPiBFLmcgdGhlIHVzZXJzcGFjZSBhY2Nlc3NvciBpcyBub3Qg
dXNlZCBieSBDQUlGL1ZPUC4KCldlbGwgYW55IGV4cG9ydGVkIHN5bWJvbHMgYXJlIGFsd2F5cyBj
b21waWxlZCBpbiwgcmlnaHQ/ClNvIHdlIGNhbiBzYXZlIHNvbWUga2VybmVsIG1lbW9yeSBieSBu
b3QgYnVpbGRpbmcgdW51c2VkIHN0dWZmIC4uLgoKCj4gPiAKPiA+IENjOiBKYXNvbiBXYW5nIDxq
YXNvd2FuZ0ByZWRoYXQuY29tPgo+ID4gQ2M6IEV1Z2VuaW8gUMOpcmV6IDxlcGVyZXptYUByZWRo
YXQuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0
LmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL3Zob3N0L3Rlc3QuYyAgIHwgNCArKy0tCj4gPiAg
IGRyaXZlcnMvdmhvc3QvdnJpbmdoLmMgfCA1ICsrKysrCj4gPiAgIGluY2x1ZGUvbGludXgvdnJp
bmdoLmggfCAyICsrCj4gPiAgIHRvb2xzL3ZpcnRpby9NYWtlZmlsZSAgfCAzICsrLQo+ID4gICA0
IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiAKPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3Rlc3QuYyBiL2RyaXZlcnMvdmhvc3QvdGVzdC5j
Cj4gPiBpbmRleCAzOTRlMmU1Yzc3MmQuLjlhM2EwOTAwNWUwMyAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvdmhvc3QvdGVzdC5jCj4gPiArKysgYi9kcml2ZXJzL3Zob3N0L3Rlc3QuYwo+ID4gQEAg
LTEyMCw3ICsxMjAsNyBAQCBzdGF0aWMgaW50IHZob3N0X3Rlc3Rfb3BlbihzdHJ1Y3QgaW5vZGUg
Kmlub2RlLCBzdHJ1Y3QgZmlsZSAqZikKPiA+ICAgCXZxc1tWSE9TVF9URVNUX1ZRXSA9ICZuLT52
cXNbVkhPU1RfVEVTVF9WUV07Cj4gPiAgIAluLT52cXNbVkhPU1RfVEVTVF9WUV0uaGFuZGxlX2tp
Y2sgPSBoYW5kbGVfdnFfa2ljazsKPiA+ICAgCXZob3N0X2Rldl9pbml0KGRldiwgdnFzLCBWSE9T
VF9URVNUX1ZRX01BWCwgVUlPX01BWElPViwKPiA+IC0JCSAgICAgICBWSE9TVF9URVNUX1BLVF9X
RUlHSFQsIFZIT1NUX1RFU1RfV0VJR0hUKTsKPiA+ICsJCSAgICAgICBWSE9TVF9URVNUX1BLVF9X
RUlHSFQsIFZIT1NUX1RFU1RfV0VJR0hULCBOVUxMKTsKPiA+ICAgCWYtPnByaXZhdGVfZGF0YSA9
IG47Cj4gPiBAQCAtMjI1LDcgKzIyNSw3IEBAIHN0YXRpYyBsb25nIHZob3N0X3Rlc3RfcmVzZXRf
b3duZXIoc3RydWN0IHZob3N0X3Rlc3QgKm4pCj4gPiAgIHsKPiA+ICAgCXZvaWQgKnByaXYgPSBO
VUxMOwo+ID4gICAJbG9uZyBlcnI7Cj4gPiAtCXN0cnVjdCB2aG9zdF91bWVtICp1bWVtOwo+ID4g
KwlzdHJ1Y3Qgdmhvc3RfaW90bGIgKnVtZW07Cj4gPiAgIAltdXRleF9sb2NrKCZuLT5kZXYubXV0
ZXgpOwo+ID4gICAJZXJyID0gdmhvc3RfZGV2X2NoZWNrX293bmVyKCZuLT5kZXYpOwo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvdnJpbmdoLmMgYi9kcml2ZXJzL3Zob3N0L3ZyaW5naC5j
Cj4gPiBpbmRleCBlZTA0OTFmNTc5YWMuLjg3OGU1NjVkZmZmZSAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvdmhvc3QvdnJpbmdoLmMKPiA+ICsrKyBiL2RyaXZlcnMvdmhvc3QvdnJpbmdoLmMKPiA+
IEBAIC0xMyw5ICsxMywxMSBAQAo+ID4gICAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgo+ID4g
ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ID4gICAjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+
Cj4gPiArI2lmZGVmIFZIT1NUX0lPVExCCj4gCj4gCj4gS2J1aWxkIGJvdCByZXBvcnRzIGJ1aWxk
IGlzc3VlcyB3aXRoIHRoaXMuCj4gCj4gSXQgbG9va3MgdG8gbWUgd2Ugc2hvdWxkIHVzZSAjaWYg
SVNfRU5BQkxFRChDT05GSUdfVkhPU1RfSU9UTEIpIGhlcmUgYW5kCj4gZm9sbG93aW5nIGNoZWNr
cy4KPiAKPiBUaGFua3MKPiAKCkluIGZhY3QgSVNfUkVBQ0hFQUJMRSBpcyBwcm9iYWJseSB0aGUg
cmlnaHQgdGhpbmcgdG8gZG8uCgoKPiAKPiA+ICAgI2luY2x1ZGUgPGxpbnV4L2J2ZWMuaD4KPiA+
ICAgI2luY2x1ZGUgPGxpbnV4L2hpZ2htZW0uaD4KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3Zob3N0
X2lvdGxiLmg+Cj4gPiArI2VuZGlmCj4gPiAgICNpbmNsdWRlIDx1YXBpL2xpbnV4L3ZpcnRpb19j
b25maWcuaD4KPiA+ICAgc3RhdGljIF9fcHJpbnRmKDEsMikgX19jb2xkIHZvaWQgdnJpbmdoX2Jh
ZChjb25zdCBjaGFyICpmbXQsIC4uLikKPiA+IEBAIC0xMDU5LDYgKzEwNjEsOCBAQCBpbnQgdnJp
bmdoX25lZWRfbm90aWZ5X2tlcm4oc3RydWN0IHZyaW5naCAqdnJoKQo+ID4gICB9Cj4gPiAgIEVY
UE9SVF9TWU1CT0wodnJpbmdoX25lZWRfbm90aWZ5X2tlcm4pOwo+ID4gKyNpZmRlZiBWSE9TVF9J
T1RMQgo+ID4gKwo+ID4gICBzdGF0aWMgaW50IGlvdGxiX3RyYW5zbGF0ZShjb25zdCBzdHJ1Y3Qg
dnJpbmdoICp2cmgsCj4gPiAgIAkJCSAgIHU2NCBhZGRyLCB1NjQgbGVuLCBzdHJ1Y3QgYmlvX3Zl
YyBpb3ZbXSwKPiA+ICAgCQkJICAgaW50IGlvdl9zaXplLCB1MzIgcGVybSkKPiA+IEBAIC0xNDE2
LDUgKzE0MjAsNiBAQCBpbnQgdnJpbmdoX25lZWRfbm90aWZ5X2lvdGxiKHN0cnVjdCB2cmluZ2gg
KnZyaCkKPiA+ICAgfQo+ID4gICBFWFBPUlRfU1lNQk9MKHZyaW5naF9uZWVkX25vdGlmeV9pb3Rs
Yik7Cj4gPiArI2VuZGlmCj4gPiAgIE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsKPiA+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L3ZyaW5naC5oIGIvaW5jbHVkZS9saW51eC92cmluZ2guaAo+ID4g
aW5kZXggYmQwNTAzY2E2ZjhmLi5lYmZmMTIxYzBiMDIgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRl
L2xpbnV4L3ZyaW5naC5oCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L3ZyaW5naC5oCj4gPiBAQCAt
MTQsOCArMTQsMTAgQEAKPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3ZpcnRpb19ieXRlb3JkZXIuaD4K
PiA+ICAgI2luY2x1ZGUgPGxpbnV4L3Vpby5oPgo+ID4gICAjaW5jbHVkZSA8bGludXgvc2xhYi5o
Pgo+ID4gKyNpZmRlZiBWSE9TVF9JT1RMQgo+ID4gICAjaW5jbHVkZSA8bGludXgvZG1hLWRpcmVj
dGlvbi5oPgo+ID4gICAjaW5jbHVkZSA8bGludXgvdmhvc3RfaW90bGIuaD4KPiA+ICsjZW5kaWYK
PiA+ICAgI2luY2x1ZGUgPGFzbS9iYXJyaWVyLmg+Cj4gPiAgIC8qIHZpcnRpb19yaW5nIHdpdGgg
aW5mb3JtYXRpb24gbmVlZGVkIGZvciBob3N0IGFjY2Vzcy4gKi8KPiA+IGRpZmYgLS1naXQgYS90
b29scy92aXJ0aW8vTWFrZWZpbGUgYi90b29scy92aXJ0aW8vTWFrZWZpbGUKPiA+IGluZGV4IGYz
M2YzMmYxZDIwOC4uZDNmMTUyZjQ2NjBiIDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvdmlydGlvL01h
a2VmaWxlCj4gPiArKysgYi90b29scy92aXJ0aW8vTWFrZWZpbGUKPiA+IEBAIC0yMiw3ICsyMiw4
IEBAIE9PVF9DT05GSUdTPVwKPiA+ICAgCUNPTkZJR19WSE9TVD1tIFwKPiA+ICAgCUNPTkZJR19W
SE9TVF9ORVQ9biBcCj4gPiAgIAlDT05GSUdfVkhPU1RfU0NTST1uIFwKPiA+IC0JQ09ORklHX1ZI
T1NUX1ZTT0NLPW4KPiA+ICsJQ09ORklHX1ZIT1NUX1ZTT0NLPW4gXAo+ID4gKwlDT05GSUdfVkhP
U1RfUklORz1uCj4gPiAgIE9PVF9CVUlMRD1LQ0ZMQUdTPSItSSAiJHtPT1RfVkhPU1R9ICR7TUFL
RX0gLUMgJHtPT1RfS1NSQ30gVj0ke1Z9Cj4gPiAgIG9vdC1idWlsZDoKPiA+ICAgCWVjaG8gIlVO
U1VQUE9SVEVEISBEb24ndCB1c2UgdGhlIHJlc3VsdGluZyBtb2R1bGVzIGluIHByb2R1Y3Rpb24h
IgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
