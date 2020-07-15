Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 472CD22095F
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 12:01:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DE332891C5;
	Wed, 15 Jul 2020 10:01:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZStsmIEeR8Fi; Wed, 15 Jul 2020 10:01:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5FC6D891BD;
	Wed, 15 Jul 2020 10:01:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38344C0733;
	Wed, 15 Jul 2020 10:01:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70503C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6B22D891BD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yi-ZeAd5Gdeq
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:01:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B9EAD87D75
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594807298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HekGS7tagFCyUygsCpeQ/B9KX+evKC/CjFFwusa1ifg=;
 b=YpE4pmWMyfyE9GWxtbAVg9EQNe4lAd+A/TqOsqbMEKRnTdGlS73OHhGyHLK40gxn1YSolz
 3DkGz1xaTFfX1MOPU3u4fHzlhDmkPUl6gmtoCijppmMMa7tlx4vFvLyqlq2D8FbIUO1an8
 /1vKHnZmi2N3Btex037NXmgWSn9nqMk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-uLXwQ8MHN7WQKch1df5zXw-1; Wed, 15 Jul 2020 06:01:34 -0400
X-MC-Unique: uLXwQ8MHN7WQKch1df5zXw-1
Received: by mail-wr1-f69.google.com with SMTP id d11so733833wrw.12
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 03:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HekGS7tagFCyUygsCpeQ/B9KX+evKC/CjFFwusa1ifg=;
 b=nTenW3F/LqwtfIPxjSe/kPCASeksbnULZ/RiGazdhnSen4vwush3nStpbjSY1m7PF5
 qsh5ahXiGva/ZgJdqIyAUlDmgoNBBm8N8kUZLe6OzumczwdznNyfL6r/9yB+5toJzbP8
 07u3kJHZ9nZ9dxQtPL7e2en+qYZf1pDXvRvN1LfhZrVxHrX+5ur6WNQioqeYX56MetFT
 Ix6TmQKSMUQpPR6uzUC11Sd/Myit0sc1lJ2j4V/VVzaD8QPLqyozeZ3Bl8K/TqVEiXVL
 2P+kL/dusjvb7JAmHBuTMFQPKT0z2kMYpRItxhv8JOrG/Ple8EFC2pKZMvRc8rkOJm/K
 /qXg==
X-Gm-Message-State: AOAM530k4W4u2TBqygPY9FEgur0yhud6gTjasHRqpG3DZNnGsr8B4gzk
 L0Jm9cuCJcyWxMAzW5ZSZ/4QtU0G5L+CblMaPIj6HFpQbgz+icdnUQ44yqoP6fSCN9TKimSyKsk
 yhbIebYIVSaY4jt8AkCsK/4kOcuPSc8zQjrb0UQXytw==
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr7919849wmg.93.1594807293253; 
 Wed, 15 Jul 2020 03:01:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1WZv6wCcqcC8E09KqCGI8Gy46vvkixsA7u+HHjLSiqLG8muYvy9tQVwLI2mOpJCOMHMsgEA==
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr7919828wmg.93.1594807293016; 
 Wed, 15 Jul 2020 03:01:33 -0700 (PDT)
Received: from redhat.com (bzq-79-180-10-140.red.bezeqint.net. [79.180.10.140])
 by smtp.gmail.com with ESMTPSA id h199sm2701343wme.42.2020.07.15.03.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 03:01:32 -0700 (PDT)
Date: Wed, 15 Jul 2020 06:01:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 6/7] ifcvf: replace irq_request/free with helpers in vDPA
 core.
Message-ID: <20200715055538-mutt-send-email-mst@kernel.org>
References: <1594565366-3195-1-git-send-email-lingshan.zhu@intel.com>
 <1594565366-3195-6-git-send-email-lingshan.zhu@intel.com>
 <c7d4eca1-b65a-b795-dfa6-fe7658716cb1@redhat.com>
 <f6fc09e2-7a45-aaa5-2b4a-f1f963c5ce2c@intel.com>
 <09e67c20-dda1-97a2-1858-6a543c64fba6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <09e67c20-dda1-97a2-1858-6a543c64fba6@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, netdev@vger.kernel.org,
 sean.j.christopherson@intel.com, virtualization@lists.linux-foundation.org,
 pbonzini@redhat.com, "Zhu, Lingshan" <lingshan.zhu@intel.com>
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

T24gV2VkLCBKdWwgMTUsIDIwMjAgYXQgMDQ6NDA6MTdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzcvMTMg5LiL5Y2INjoyMiwgWmh1LCBMaW5nc2hhbiB3cm90ZToKPiA+
IAo+ID4gCj4gPiBPbiA3LzEzLzIwMjAgNDozMyBQTSwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4g
Cj4gPiA+IE9uIDIwMjAvNy8xMiDkuIvljYgxMDo0OSwgWmh1IExpbmdzaGFuIHdyb3RlOgo+ID4g
PiA+IFRoaXMgY29tbWl0IHJlcGxhY2VkIGlycV9yZXF1ZXN0L2ZyZWUoKSB3aXRoIGhlbHBlcnMg
aW4gdkRQQQo+ID4gPiA+IGNvcmUsIHNvIHRoYXQgaXQgY2FuIHJlcXVlc3QvZnJlZSBpcnEgYW5k
IHNldHVwIGlycSBvZmZsb2FkaW5nCj4gPiA+ID4gb24gb3JkZXIuCj4gPiA+ID4gCj4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPgo+ID4g
PiA+IC0tLQo+ID4gPiA+IMKgIGRyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMgfCAxMSAr
KysrKystLS0tLQo+ID4gPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS9p
ZmN2Zi9pZmN2Zl9tYWluLmMKPiA+ID4gPiBiL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWlu
LmMKPiA+ID4gPiBpbmRleCBmNWE2MGMxLi42NWI4NGUxIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2Ry
aXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL3ZkcGEv
aWZjdmYvaWZjdmZfbWFpbi5jCj4gPiA+ID4gQEAgLTQ3LDExICs0NywxMiBAQCBzdGF0aWMgdm9p
ZCBpZmN2Zl9mcmVlX2lycShzdHJ1Y3QKPiA+ID4gPiBpZmN2Zl9hZGFwdGVyICphZGFwdGVyLCBp
bnQgcXVldWVzKQo+ID4gPiA+IMKgIHsKPiA+ID4gPiDCoMKgwqDCoMKgIHN0cnVjdCBwY2lfZGV2
ICpwZGV2ID0gYWRhcHRlci0+cGRldjsKPiA+ID4gPiDCoMKgwqDCoMKgIHN0cnVjdCBpZmN2Zl9o
dyAqdmYgPSAmYWRhcHRlci0+dmY7Cj4gPiA+ID4gK8KgwqDCoCBzdHJ1Y3QgdmRwYV9kZXZpY2Ug
KnZkcGEgPSAmYWRhcHRlci0+dmRwYTsKPiA+ID4gPiDCoMKgwqDCoMKgIGludCBpOwo+ID4gPiA+
IMKgIMKgIMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IHF1ZXVlczsgaSsrKQo+ID4gPiA+IC3C
oMKgwqDCoMKgwqDCoCBkZXZtX2ZyZWVfaXJxKCZwZGV2LT5kZXYsIHZmLT52cmluZ1tpXS5pcnEs
ICZ2Zi0+dnJpbmdbaV0pOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCB2ZHBhX2ZyZWVfdnFfaXJx
KCZwZGV2LT5kZXYsIHZkcGEsIHZmLT52cmluZ1tpXS5pcnEsIGksCj4gPiA+ID4gJnZmLT52cmlu
Z1tpXSk7Cj4gPiA+ID4gwqAgwqDCoMKgwqDCoCBpZmN2Zl9mcmVlX2lycV92ZWN0b3JzKHBkZXYp
Owo+ID4gPiA+IMKgIH0KPiA+ID4gPiBAQCAtNjAsNiArNjEsNyBAQCBzdGF0aWMgaW50IGlmY3Zm
X3JlcXVlc3RfaXJxKHN0cnVjdAo+ID4gPiA+IGlmY3ZmX2FkYXB0ZXIgKmFkYXB0ZXIpCj4gPiA+
ID4gwqAgewo+ID4gPiA+IMKgwqDCoMKgwqAgc3RydWN0IHBjaV9kZXYgKnBkZXYgPSBhZGFwdGVy
LT5wZGV2Owo+ID4gPiA+IMKgwqDCoMKgwqAgc3RydWN0IGlmY3ZmX2h3ICp2ZiA9ICZhZGFwdGVy
LT52ZjsKPiA+ID4gPiArwqDCoMKgIHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSA9ICZhZGFwdGVy
LT52ZHBhOwo+ID4gPiA+IMKgwqDCoMKgwqAgaW50IHZlY3RvciwgaSwgcmV0LCBpcnE7Cj4gPiA+
ID4gwqAgwqDCoMKgwqDCoCByZXQgPSBwY2lfYWxsb2NfaXJxX3ZlY3RvcnMocGRldiwgSUZDVkZf
TUFYX0lOVFIsCj4gPiA+ID4gQEAgLTczLDYgKzc1LDcgQEAgc3RhdGljIGludCBpZmN2Zl9yZXF1
ZXN0X2lycShzdHJ1Y3QKPiA+ID4gPiBpZmN2Zl9hZGFwdGVyICphZGFwdGVyKQo+ID4gPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHBjaV9uYW1lKHBkZXYpKTsKPiA+ID4gPiDCoMKgwqDCoMKgIHZl
Y3RvciA9IDA7Cj4gPiA+ID4gwqDCoMKgwqDCoCBpcnEgPSBwY2lfaXJxX3ZlY3RvcihwZGV2LCB2
ZWN0b3IpOwo+ID4gPiA+ICvCoMKgwqAgLyogY29uZmlnIGludGVycnVwdCAqLwo+ID4gPiAKPiA+
ID4gCj4gPiA+IFVubmVjZXNzYXJ5IGNoYW5nZXMuCj4gPiBUaGlzIGlzIHRvIHNob3cgd2UgZGlk
IG5vdCBzZXR1cCB0aGlzIGlycSBvZmZsb2FkaW5nIGZvciBjb25maWcKPiA+IGludGVycnVwdCwg
b25seSBzZXR1cCBpcnEgb2ZmbG9hZGluZyBmb3IgZGF0YSB2cS4gQnV0IGNhbiByZW1vdmUgdGhp
cwo+ID4gc2luY2Ugd2UgaGF2ZSBjb25maWdfbXNpeF9uYW1lIGluIGNvZGUgdG8gc2hvdyB3aGF0
IGl0IGlzCj4gCj4gCj4gQnR3LCBhbnkgcmVhc29uIGZvciBub3QgbWFraW5nIGNvbmZpZyBpbnRl
cnJ1cHQgd29yayBmb3IgaXJxIG9mZmxvYWRpbmc/IEkKPiBkb24ndCBzZWUgYW55IHRoaW5nIHRo
YXQgYmxvY2tzIHRoaXMuCj4gCj4gVGhhbmtzCgpXZWxsIGNvbmZpZyBhY2Nlc3NlcyBhbGwgZ28g
dGhyb3VnaCB1c2Vyc3BhY2UgcmlnaHQ/CkRvaW5nIGNvbmZpZyBpbnRlcnJ1cHQgZGlyZWN0bHkg
d291bGQganVzdCBiZSBtZXNzeSAuLi4KCgo+IAo+ID4gVGhhbmtzIEJSIFpodSBMaW5nc2hhbgo+
ID4gPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
