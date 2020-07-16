Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B605D221C6B
	for <lists.virtualization@lfdr.de>; Thu, 16 Jul 2020 08:13:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 518CC204ED;
	Thu, 16 Jul 2020 06:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rxEdKUsQHp6v; Thu, 16 Jul 2020 06:13:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 478E0204DC;
	Thu, 16 Jul 2020 06:13:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C964C0733;
	Thu, 16 Jul 2020 06:13:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4944DC0733
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 338598A4D8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id adXWNBNNhVmQ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:13:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 423D28A4D0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594879987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1M+pW97CHknoejGWyybKRR4Skij2QdcP792WLZ7CQAc=;
 b=F7bjhcsSOsZuU1Qn1BK7I8yfage2J7weWng/NowNtsB0jxOXTO4W1jELSMxleYmYo1FOYw
 kj0NZphNi6mx1b2/GEOAPYboLJgVzCJNSCZExHQJbrhUxH3RCWkGxujNF7Q2kiQkPsnRAH
 gQM8KQQNtIz53PyGkZRbdiYaca5FvMA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-2ZgvL-NtOWCYsTrM6oNhpQ-1; Thu, 16 Jul 2020 02:13:05 -0400
X-MC-Unique: 2ZgvL-NtOWCYsTrM6oNhpQ-1
Received: by mail-wr1-f69.google.com with SMTP id i12so4601190wrx.11
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 23:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1M+pW97CHknoejGWyybKRR4Skij2QdcP792WLZ7CQAc=;
 b=m/Nz4tKk421NTrYtuW24eYbytcgrzJl5HsXH/wRZYYqCTFT5szx7KJYQ1mxALgYzDl
 fWs/jGAvAhEFibB796sD26hGEnBNOXjvQHWY6ULUF73UxWTZuC9vPBdpwVM2YvXO+lU+
 Z/sg2OYx4PtVX6yS9ySxpfdhqaLtbYrLy275gzdjfhiR1DaARMKYuQVjtLEXwu/tqH6s
 LdEUEf5HsMPaguJ/Z4j/CD2r6IIMtgDEe7nK8W75PYXj1+QcuOXH6nVy4/2883l4Gegi
 L5tjTaayH9RUgqdjUPp46IPGVvGzDO21s7KzaTebujQpd0ykrMo6lgKXcWaF1H0v760o
 bB3w==
X-Gm-Message-State: AOAM530BOBAA7K9QRlK6gH8xNbHRZVwOVuJ/YIM2+jfkOIR4l8uZw9td
 46ik7im++c9mV5ZCvuGV8wbRf5ZA44O8WcZYEYRD12RNbv5ayE/LolYnDk5rYUEBA6P7yHj4yye
 CgtxhdL0gvKlYkEljo9jKDujVqSjOOwOKeUeOzMITHg==
X-Received: by 2002:a1c:9a81:: with SMTP id c123mr2755143wme.46.1594879984220; 
 Wed, 15 Jul 2020 23:13:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzT8cU5kZjDJ+n5Z01Aw/B3E42nszir+5RtL0b0T6rIbKUWMpod41qWfNHCANmeyj9AKRZROw==
X-Received: by 2002:a1c:9a81:: with SMTP id c123mr2755118wme.46.1594879983933; 
 Wed, 15 Jul 2020 23:13:03 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 p29sm7031185wmi.43.2020.07.15.23.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 23:13:03 -0700 (PDT)
Date: Thu, 16 Jul 2020 02:13:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Subject: Re: [PATCH 0/7] *** IRQ offloading for vDPA ***
Message-ID: <20200716021111-mutt-send-email-mst@kernel.org>
References: <1594565524-3394-1-git-send-email-lingshan.zhu@intel.com>
 <70244d80-08a4-da91-3226-7bfd2019467e@redhat.com>
 <97032c51-3265-c94a-9ce1-f42fcc6d3075@intel.com>
MIME-Version: 1.0
In-Reply-To: <97032c51-3265-c94a-9ce1-f42fcc6d3075@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, netdev@vger.kernel.org,
 sean.j.christopherson@intel.com, virtualization@lists.linux-foundation.org,
 pbonzini@redhat.com
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

T24gVGh1LCBKdWwgMTYsIDIwMjAgYXQgMDk6Mzk6MTdBTSArMDgwMCwgWmh1LCBMaW5nc2hhbiB3
cm90ZToKPiAKPiBPbiA3LzE1LzIwMjAgOTo0MyBQTSwgSmFzb24gV2FuZyB3cm90ZToKPiAKPiAK
PiAgICAgT24gMjAyMC83LzEyIOS4i+WNiDEwOjUyLCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gCj4g
ICAgICAgICBIaSBBbGwsCj4gCj4gICAgICAgICBUaGlzIHNlcmllcyBpbnRlbmRzIHRvIGltcGxl
bWVudCBJUlEgb2ZmbG9hZGluZyBmb3IKPiAgICAgICAgIHZob3N0X3ZkcGEuCj4gCj4gICAgICAg
ICBCeSB0aGUgZmVhdCBvZiBpcnEgZm9yd2FyZGluZyBmYWNpbGl0aWVzIGxpa2UgcG9zdGVkCj4g
ICAgICAgICBpbnRlcnJ1cHQgb24gWDg2LCBpcnEgYnlwYXNzIGNhbsKgIGhlbHAgZGVsaXZlcgo+
ICAgICAgICAgaW50ZXJydXB0cyB0byB2Q1BVIGRpcmVjdGx5Lgo+IAo+ICAgICAgICAgdkRQQSBk
ZXZpY2VzIGhhdmUgZGVkaWNhdGVkIGhhcmR3YXJlIGJhY2tlbmRzIGxpa2UgVkZJTwo+ICAgICAg
ICAgcGFzcy10aHJvdWdoZWQgZGV2aWNlcy4gU28gaXQgd291bGQgYmUgcG9zc2libGUgdG8gc2V0
dXAKPiAgICAgICAgIGlycSBvZmZsb2FkaW5nKGlycSBieXBhc3MpIGZvciB2RFBBIGRldmljZXMg
YW5kIGdhaW4KPiAgICAgICAgIHBlcmZvcm1hbmNlIGltcHJvdmVtZW50cy4KPiAKPiAgICAgICAg
IEluIG15IHRlc3RpbmcsIHdpdGggdGhpcyBmZWF0dXJlLCB3ZSBjYW4gc2F2ZSAwLjFtcwo+ICAg
ICAgICAgaW4gYSBwaW5nIGJldHdlZW4gdHdvIFZGcyBvbiBhdmVyYWdlLgo+IAo+IAo+IAo+ICAg
ICBIaSBMaW5nc2hhbjoKPiAKPiAgICAgRHVyaW5nIHRoZSB2aXJ0aW8tbmV0d29ya2luZyBtZWV0
aW5nLCBNaWNoYWVsIHNwb3RzIHR3byBwb3NzaWJsZSBpc3N1ZXM6Cj4gCj4gICAgIDEpIGRvIHdl
IG5lZWQgYW4gbmV3IHVBUEkgdG8gc3RvcCB0aGUgaXJxIG9mZmxvYWRpbmc/Cj4gICAgIDIpIGNh
biBpbnRlcnJ1cHQgbG9zdCBkdXJpbmcgdGhlIGV2ZW50ZmQgY3R4Pwo+IAo+ICAgICBGb3IgMSkg
SSB0aGluayB3ZSBwcm9iYWJseSBub3QsIHdlIGNhbiBhbGxvY2F0ZSBhbiBpbmRlcGVuZGVudCBl
dmVudGZkCj4gICAgIHdoaWNoIGRvZXMgbm90IG1hcCB0byBNU0lYLiBTbyB0aGUgY29uc3VtZXIg
Y2FuJ3QgbWF0Y2ggdGhlIHByb2R1Y2VyIGFuZCB3ZQo+ICAgICBmYWxsYmFjayB0byBldmVudGZk
IGJhc2VkIGlycS4KPiAKPiBIaSBKYXNvbiwKPiAKPiBJIHdvbmRlciB3aHkgd2UgbmVlZCB0byBz
dG9wIGlycSBvZmZsb2FkaW5nLCBidXQgaWYgd2UgbmVlZCB0byBkbyBzbywgbWF5YmUgYSBuZXcg
dUFQSSB3b3VsZCBiZSBtb3JlIGludHVpdGl2ZSB0byBtZSwKPiBidXQgd2h5IGFuZCB3aG8odXNl
cj8gcWVtdT8pIHNoYWxsIGluaXRpYWxpemUgdGhpcyBwcm9jZXNzLCBiYXNlZCBvbiB3aGF0IGtp
bmRhIG9mIGJhc2lzIHRvIG1ha2UgdGhlIGRlY2lzaW9uPwo+IAo+ICAgICBGb3IgMikgaXQgbG9v
a3MgdG8gbWUgZ3Vlc3Qgc2hvdWxkIGRlYWwgd2l0aCB0aGUgaXJxIHN5bmNocm9uaXphdGlvbiB3
aGVuCj4gICAgIG1hc2sgb3IgdW5tYXNrIE1TSVggdmVjdG9ycy4KPiAKPiBBZ3JlZWQhCgpXZWxs
IHdlIG5lZWQgdG8gbWFrZSBzdXJlIGR1cmluZyBhIHN3aXRjaCBlYWNoIGludGVycnVwdCBpcyBy
ZXBvcnRlZAoqc29tZXdoZXJlKjogZWl0aGVyIGlycSBvciBldmVudGZkIC0gYW5kIG5vdCBsb3N0
LgoKCj4gVGhhbmtzLAo+IEJSCj4gWmh1IExpbmdzaGFuCj4gCj4gCj4gICAgIFdoYXQncyB5b3Vy
IHRob3VnaHQ/Cj4gCj4gICAgIFRoYW5rcwo+IAo+IAo+IAo+IAo+IAo+ICAgICAgICAgWmh1IExp
bmdzaGFuICg3KToKPiAgICAgICAgIMKgwqAgdmhvc3Q6IGludHJvZHVjZSB2aG9zdF9jYWxsX2N0
eAo+ICAgICAgICAgwqDCoCBrdm0vdmZpbzogZGV0ZWN0IGFzc2lnbmVkIGRldmljZSB2aWEgaXJx
YnlwYXNzIG1hbmFnZXIKPiAgICAgICAgIMKgwqAgdmhvc3RfdmRwYTogaW1wbGVtZW50IElSUSBv
ZmZsb2FkaW5nIGZ1bmN0aW9ucyBpbiB2aG9zdF92ZHBhCj4gICAgICAgICDCoMKgIHZEUEE6IGlt
cGxlbWVudCBJUlEgb2ZmbG9hZGluZyBoZWxwZXJzIGluIHZEUEEgY29yZQo+ICAgICAgICAgwqDC
oCB2aXJ0aW9fdmRwYTogaW5pdCBJUlEgb2ZmbG9hZGluZyBmdW5jdGlvbiBwb2ludGVycyB0byBO
VUxMLgo+ICAgICAgICAgwqDCoCBpZmN2ZjogcmVwbGFjZSBpcnFfcmVxdWVzdC9mcmVlIHdpdGgg
aGVscGVycyBpbiB2RFBBIGNvcmUuCj4gICAgICAgICDCoMKgIGlycWJ5cGFzczogZG8gbm90IHN0
YXJ0IGNvbnN1bWVyIG9yIHByb2R1Y2VyIHdoZW4gZmFpbGVkIHRvIGNvbm5lY3QKPiAKPiAgICAg
ICAgIMKgIGFyY2gveDg2L2t2bS94ODYuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTAg
KysrKy0tCj4gICAgICAgICDCoCBkcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jIHwgMTEg
KysrLS0tCj4gICAgICAgICDCoCBkcml2ZXJzL3ZkcGEvdmRwYS5jwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgNDYgKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgICAgICAgwqAgZHJpdmVy
cy92aG9zdC9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKwo+ICAgICAgICAgwqAg
ZHJpdmVycy92aG9zdC92ZHBhLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNzUKPiAgICAgICAg
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4gICAgICAgICDCoCBk
cml2ZXJzL3Zob3N0L3Zob3N0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIyICsrKysrKysrLS0t
LQo+ICAgICAgICAgwqAgZHJpdmVycy92aG9zdC92aG9zdC5owqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDkgKysrKy0KPiAgICAgICAgIMKgIGRyaXZlcnMvdmlydGlvL3ZpcnRpb192ZHBhLmPCoMKg
wqAgfMKgIDIgKysKPiAgICAgICAgIMKgIGluY2x1ZGUvbGludXgvdmRwYS5owqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDExICsrKysrKwo+ICAgICAgICAgwqAgdmlydC9rdm0vdmZpby5jwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgLS0KPiAgICAgICAgIMKgIHZpcnQvbGli
L2lycWJ5cGFzcy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE2ICsrKysrLS0tLQo+ICAgICAg
ICAgwqAgMTEgZmlsZXMgY2hhbmdlZCwgMTgxIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygt
KQo+IAo+IAo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
