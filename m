Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9E76C723C
	for <lists.virtualization@lfdr.de>; Thu, 23 Mar 2023 22:18:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98D4241E32;
	Thu, 23 Mar 2023 21:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98D4241E32
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OT/g8x3k
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nPReu-fAcajy; Thu, 23 Mar 2023 21:18:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7D63241E30;
	Thu, 23 Mar 2023 21:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D63241E30
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA8C6C008A;
	Thu, 23 Mar 2023 21:18:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C147C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 21:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 630D041E1F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 21:18:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 630D041E1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PX66l5_eEH0V
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 21:18:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 813B541C6C
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 813B541C6C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 21:18:33 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id bi31so4569379oib.9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 14:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679606312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v4xYkg94aW7mOvwdHMLFD/HOVWTkOTnTBr9DxtYM8pU=;
 b=OT/g8x3kC1h4WbiTNhFkqLk9Umy7HUK3Qmxi8mw4kgrv9WAxJy2ueS3sq/iOUNfiyP
 G6g1ds3z7BQyXVtaYJVpuDPqNTctXWVefar+Jm1V/Qse0VZNETE+hw9oOsjbu+AwGJeC
 wHlJ9E2u2U2HHZ0c3SmHlwHWMEQlVA1VkrYUszf0Rm8WkETNRY0KM7O/K8Ex5mSR3MDn
 b7JeAowXBkumDsR02SV3/IL+aJO7lvfxdR8xnaovAkJlND2/ioHRP65hGSA6aWb+fBgM
 heYeaDfCKVKD7x/o7gbt9KzEHYfBy55Vsgl2tWnZgQXVMLlCIsrSLIjRsW5xzFTOBMO6
 1JLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679606312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v4xYkg94aW7mOvwdHMLFD/HOVWTkOTnTBr9DxtYM8pU=;
 b=nRBUBgHvZYBziCh2sLpptNJJL1WP+OUYz8pzA5MogeaDTaFWWgGv94UaWiz26V8c54
 oMWI3DXoCtBfYas1BzzEUjTWQtS/Rf6JF0DHLadbJCf9PlMLl1zYhUCnErf2xkoT30cB
 kd/n+CSa2S3PJRUhFp0WqeidI95+CzyRKWA7GMW9HEER2xBh6/vVZvlBEN0TFPnP9WV0
 0Grmflr4ldya3HvNW+Bh9Yc4u2fIdrQYVxMtCXOXRUlhxjT3Uv7nXB2PRQI9Z9a4p+FO
 ISME7x1ohRAsLqTfQxBBozz4HDnLKFVrVB8Pl1MLunUIz4S/87zWm6LTO4hOjPfAgKtt
 +siQ==
X-Gm-Message-State: AO0yUKVMy+X0Px95cQjFQWlknNr1civLrf9eqvc0DHstkjvhb3zOpY03
 lGXi5ykTgvT6s1ElQaj9Ll9Xc17g4s1/o3+xqWc=
X-Google-Smtp-Source: AK7set8jY446IH6p6mHp1ba5OkPGyg2Zcs2qhKucO8I30/S+qexfrKxW6Y/Vnvc+vn2stcIhs0KKPJp7G1z6NNAg/OI=
X-Received: by 2002:a05:6808:659:b0:378:30dc:ae5b with SMTP id
 z25-20020a056808065900b0037830dcae5bmr28539oih.5.1679606312499; Thu, 23 Mar
 2023 14:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230323190340.950875-1-dmitry.osipenko@collabora.com>
 <20230323190340.950875-3-dmitry.osipenko@collabora.com>
In-Reply-To: <20230323190340.950875-3-dmitry.osipenko@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 23 Mar 2023 14:18:21 -0700
Message-ID: <CAF6AEGs28wzuXc3w+qYvcUH+dT271w=dtxmzKfR6zgHqXqjMzQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/virtio: Support sync objects
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@redhat.com>, kernel@collabora.com,
 virtualization@lists.linux-foundation.org, Chia-I Wu <olvaffe@gmail.com>,
 Emil Velikov <emil.velikov@collabora.com>
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

T24gVGh1LCBNYXIgMjMsIDIwMjMgYXQgMTI6MDXigK9QTSBEbWl0cnkgT3NpcGVua28KPGRtaXRy
eS5vc2lwZW5rb0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IEFkZCBzeW5jIG9iamVjdCBEUk0g
VUFQSSBzdXBwb3J0IHRvIFZpcnRJTy1HUFUgZHJpdmVyLiBJdCdzIHJlcXVpcmVkCj4gZm9yIGVu
YWJsaW5nIGEgZnVsbC1mZWF0dXJlZCBWdWxrYW4gZmVuY2luZyBieSBWZW51cyBhbmQgbmF0aXZl
IGNvbnRleHQKPiBWaXJ0SU8tR1BVIE1lc2EgZHJpdmVycy4KPgo+IFNpZ25lZC1vZmYtYnk6IERt
aXRyeSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuYyAgICB8ICAgMyArLQo+ICBkcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfc3VibWl0LmMgfCAyMTEgKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIGluY2x1ZGUvdWFwaS9kcm0vdmlydGdwdV9kcm0uaCAgICAgICAgICB8ICAxNiAr
LQo+ICAzIGZpbGVzIGNoYW5nZWQsIDIyOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuYwo+IGluZGV4IGFkZDA3NTY4MWUxOC4u
YTIyMTU1NTc3MTUyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdw
dV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuYwo+IEBA
IC0xNzYsNyArMTc2LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZHJpdmVyIGRyaXZlciA9
IHsKPiAgICAgICAgICAqIElmIEtNUyBpcyBkaXNhYmxlZCBEUklWRVJfTU9ERVNFVCBhbmQgRFJJ
VkVSX0FUT01JQyBhcmUgbWFza2VkCj4gICAgICAgICAgKiBvdXQgdmlhIGRybV9kZXZpY2U6OmRy
aXZlcl9mZWF0dXJlczoKPiAgICAgICAgICAqLwo+IC0gICAgICAgLmRyaXZlcl9mZWF0dXJlcyA9
IERSSVZFUl9NT0RFU0VUIHwgRFJJVkVSX0dFTSB8IERSSVZFUl9SRU5ERVIgfCBEUklWRVJfQVRP
TUlDLAo+ICsgICAgICAgLmRyaXZlcl9mZWF0dXJlcyA9IERSSVZFUl9NT0RFU0VUIHwgRFJJVkVS
X0dFTSB8IERSSVZFUl9SRU5ERVIgfCBEUklWRVJfQVRPTUlDIHwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICBEUklWRVJfU1lOQ09CSiB8IERSSVZFUl9TWU5DT0JKX1RJTUVMSU5FLAo+ICAg
ICAgICAgLm9wZW4gPSB2aXJ0aW9fZ3B1X2RyaXZlcl9vcGVuLAo+ICAgICAgICAgLnBvc3RjbG9z
ZSA9IHZpcnRpb19ncHVfZHJpdmVyX3Bvc3RjbG9zZSwKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfc3VibWl0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlv
L3ZpcnRncHVfc3VibWl0LmMKPiBpbmRleCAyY2UyNDU5YzZiYzIuLjllYTQzOTA5NDhiZiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfc3VibWl0LmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfc3VibWl0LmMKPiBAQCAtMTQsMTEgKzE0
LDI2IEBACj4gICNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+Cj4KPiAgI2luY2x1ZGUgPGRybS9k
cm1fZmlsZS5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9zeW5jb2JqLmg+Cj4gICNpbmNsdWRlIDxk
cm0vdmlydGdwdV9kcm0uaD4KPgo+ICAjaW5jbHVkZSAidmlydGdwdV9kcnYuaCIKPgo+ICtzdHJ1
Y3QgdmlydGlvX2dwdV9zdWJtaXRfcG9zdF9kZXAgewo+ICsgICAgICAgc3RydWN0IGRybV9zeW5j
b2JqICpzeW5jb2JqOwo+ICsgICAgICAgc3RydWN0IGRtYV9mZW5jZV9jaGFpbiAqY2hhaW47Cj4g
KyAgICAgICB1aW50NjRfdCBwb2ludDsKPiArfTsKPiArCj4gIHN0cnVjdCB2aXJ0aW9fZ3B1X3N1
Ym1pdCB7Cj4gKyAgICAgICBzdHJ1Y3QgdmlydGlvX2dwdV9zdWJtaXRfcG9zdF9kZXAgKnBvc3Rf
ZGVwczsKPiArICAgICAgIHVuc2lnbmVkIGludCBudW1fb3V0X3N5bmNvYmpzOwo+ICsKPiArICAg
ICAgIHN0cnVjdCBkcm1fc3luY29iaiAqKmluX3N5bmNvYmpzOwo+ICsgICAgICAgdW5zaWduZWQg
aW50IG51bV9pbl9zeW5jb2JqczsKPiArICAgICAgIHVpbnQ2NF90ICppbl9mZW5jZV9pZHM7Cj4g
KyAgICAgICB1bnNpZ25lZCBpbnQgbnVtX2luX2ZlbmNlX2lkczsKPiArCj4gICAgICAgICBzdHJ1
Y3QgdmlydGlvX2dwdV9vYmplY3RfYXJyYXkgKmJ1Zmxpc3Q7Cj4gICAgICAgICBzdHJ1Y3QgZHJt
X3ZpcnRncHVfZXhlY2J1ZmZlciAqZXhidWY7Cj4gICAgICAgICBzdHJ1Y3QgdmlydGlvX2dwdV9m
ZW5jZSAqb3V0X2ZlbmNlOwo+IEBAIC01OCw2ICs3MywxODYgQEAgc3RhdGljIGludCB2aXJ0aW9f
Z3B1X2RtYV9mZW5jZV93YWl0KHN0cnVjdCB2aXJ0aW9fZ3B1X3N1Ym1pdCAqc3VibWl0LAo+ICAg
ICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICtzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X2ZyZWVfc3lu
Y29ianMoc3RydWN0IGRybV9zeW5jb2JqICoqc3luY29ianMsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IG5yX3N5bmNvYmpzKQo+ICt7Cj4gKyAgICAgICB1
aW50MzJfdCBpID0gbnJfc3luY29ianM7Cj4gKwo+ICsgICAgICAgd2hpbGUgKHN5bmNvYmpzICYm
IGktLSkgewoKQ2hlY2tpbmcgc3luY29ianMhPU5VTEwgaGVyZSBkb2VzIGF0IGxlYXN0IGxvb2sg
YSBiaXQgZnVubnksIGFzIHRoZQpjb25kaXRpb24gZG9lc24ndCBjaGFuZ2UgaW4gdGhlIGxvb3Ag
Ym9keS4gIEl0IGlzIG5vdCBpbmNvcnJlY3QsIGl0CnByb3RlY3RzIHlvdSBhZ2FpbnN0IHRoZSBj
bGVhbnVwIHBhdGggd2hlcmUgc3VibWl0LT5pbl9zeW5jb2JqcyBpcwpOVUxMLiAgQnV0IGlmICgh
c3luY29ianMpXG5yZXR1cm4gc2VlbXMgYSBiaXQgbW9yZSBjbGVhcgoKCj4gKyAgICAgICAgICAg
ICAgIGlmIChzeW5jb2Jqc1tpXSkKPiArICAgICAgICAgICAgICAgICAgICAgICBkcm1fc3luY29i
al9wdXQoc3luY29ianNbaV0pOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGtmcmVlKHN5bmNv
YmpzKTsKPiArfQo+ICsKPiArc3RhdGljIGludAo+ICt2aXJ0aW9fZ3B1X3BhcnNlX2RlcHMoc3Ry
dWN0IHZpcnRpb19ncHVfc3VibWl0ICpzdWJtaXQpCj4gK3sKPiArICAgICAgIHN0cnVjdCBkcm1f
dmlydGdwdV9leGVjYnVmZmVyICpleGJ1ZiA9IHN1Ym1pdC0+ZXhidWY7Cj4gKyAgICAgICBzdHJ1
Y3QgZHJtX3ZpcnRncHVfZXhlY2J1ZmZlcl9zeW5jb2JqIHN5bmNvYmpfZGVzYzsKPiArICAgICAg
IHNpemVfdCBzeW5jb2JqX3N0cmlkZSA9IGV4YnVmLT5zeW5jb2JqX3N0cmlkZTsKPiArICAgICAg
IHN0cnVjdCBkcm1fc3luY29iaiAqKnN5bmNvYmpzOwo+ICsgICAgICAgaW50IHJldCA9IDAsIGk7
Cj4gKwo+ICsgICAgICAgaWYgKCFzdWJtaXQtPm51bV9pbl9zeW5jb2JqcykKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAgICAgc3luY29ianMgPSBrY2FsbG9jKHN1Ym1pdC0+
bnVtX2luX3N5bmNvYmpzLCBzaXplb2YoKnN5bmNvYmpzKSwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICBHRlBfS0VSTkVMIHwgX19HRlBfTk9XQVJOIHwgX19HRlBfTk9SRVRSWSk7CgpJICp0
aGluayosIGFzc3VtaW5nIEknbSByZWFkaW5nIHdoZXJlIHRoaXMgaXMgY2FsbGVkIGNvcnJlY3Rs
eSAoa2luZGEKd2lzaCBnaXQgd291bGQgc2hvdyBtb3JlIGxpbmVzIG9mIGNvbnRleHQgYnkgZGVm
YXVsdCkgdGhhdCB0aGVzZSBkb24ndApuZWVkIHRvIGJlIE5PV0FSTnxOT1JFVFJZIChzYW1lIGZv
ciBwb3N0X2RlcHMpLiAgSSBndWVzcyB5b3UgaW5oZXJpdGVkCnRoaXMgZnJvbSBkcm0vbXNtLCB3
aGVyZSBJIGFwcGVhciB0byBoYXZlIGZvcmdvdHRlbiB0byB1cGRhdGUgdGhlCnN5bmNvYmogcGF0
aCBpbiBjb21taXQgZjBkZTQwYTEzMWQ5ICgiZHJtL21zbTogUmVvcmRlciBsb2NrIHZzIHN1Ym1p
dAphbGxvYyIpLiAgSSBkb24ndCBzZWUgYW55dGhpbmcgb2J2aW91cyB0aGF0IHdvdWxkIHJlcXVp
cmUgTk9SRVRSWSwgYnV0CmxvY2tkZXAgc2hvdWxkIGJlIGFibGUgdG8gdGVsbCB5b3Ugb3RoZXJ3
aXNlIGlmIG5lZWRlZC4uCgpCUiwKLVIKCj4gKyAgICAgICBpZiAoIXN5bmNvYmpzKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiArCj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwg
c3VibWl0LT5udW1faW5fc3luY29ianM7IGkrKykgewo+ICsgICAgICAgICAgICAgICB1aW50NjRf
dCBhZGRyZXNzID0gZXhidWYtPmluX3N5bmNvYmpzICsgaSAqIHN5bmNvYmpfc3RyaWRlOwo+ICsg
ICAgICAgICAgICAgICBzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZTsKPiArCj4gKyAgICAgICAgICAg
ICAgIGlmIChjb3B5X2Zyb21fdXNlcigmc3luY29ial9kZXNjLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdTY0X3RvX3VzZXJfcHRyKGFkZHJlc3MpLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbWluKHN5bmNvYmpfc3RyaWRlLCBzaXplb2Yoc3luY29i
al9kZXNjKSkpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gLUVGQVVMVDsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiAr
ICAgICAgICAgICAgICAgaWYgKHN5bmNvYmpfZGVzYy5mbGFncyAmIH5WSVJUR1BVX0VYRUNCVUZf
U1lOQ09CSl9GTEFHUykgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgICAgICAgIH0KPiAr
Cj4gKyAgICAgICAgICAgICAgIHJldCA9IGRybV9zeW5jb2JqX2ZpbmRfZmVuY2Uoc3VibWl0LT5m
aWxlLCBzeW5jb2JqX2Rlc2MuaGFuZGxlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN5bmNvYmpfZGVzYy5wb2ludCwgMCwgJmZlbmNlKTsKPiArICAgICAg
ICAgICAgICAgaWYgKHJldCkKPiArICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiArCj4g
KyAgICAgICAgICAgICAgIHJldCA9IHZpcnRpb19ncHVfZG1hX2ZlbmNlX3dhaXQoc3VibWl0LCBm
ZW5jZSk7Cj4gKwo+ICsgICAgICAgICAgICAgICBkbWFfZmVuY2VfcHV0KGZlbmNlKTsKPiArICAg
ICAgICAgICAgICAgaWYgKHJldCkKPiArICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAr
Cj4gKyAgICAgICAgICAgICAgIGlmIChzeW5jb2JqX2Rlc2MuZmxhZ3MgJiBWSVJUR1BVX0VYRUNC
VUZfU1lOQ09CSl9SRVNFVCkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHN5bmNvYmpzW2ld
ID0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9zeW5jb2JqX2ZpbmQoc3Vi
bWl0LT5maWxlLCBzeW5jb2JqX2Rlc2MuaGFuZGxlKTsKPiArICAgICAgICAgICAgICAgICAgICAg
ICBpZiAoIXN5bmNvYmpzW2ldKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXQgPSAtRUlOVkFMOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICB9
Cj4gKwo+ICsgICAgICAgaWYgKHJldCkgewo+ICsgICAgICAgICAgICAgICB2aXJ0aW9fZ3B1X2Zy
ZWVfc3luY29ianMoc3luY29ianMsIGkpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+
ICsgICAgICAgfQo+ICsKPiArICAgICAgIHN1Ym1pdC0+aW5fc3luY29ianMgPSBzeW5jb2JqczsK
PiArCj4gKyAgICAgICByZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCB2aXJ0aW9f
Z3B1X3Jlc2V0X3N5bmNvYmpzKHN0cnVjdCBkcm1fc3luY29iaiAqKnN5bmNvYmpzLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgbnJfc3luY29ianMpCj4g
K3sKPiArICAgICAgIHVpbnQzMl90IGk7Cj4gKwo+ICsgICAgICAgZm9yIChpID0gMDsgc3luY29i
anMgJiYgaSA8IG5yX3N5bmNvYmpzOyBpKyspIHsKPiArICAgICAgICAgICAgICAgaWYgKHN5bmNv
YmpzW2ldKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGRybV9zeW5jb2JqX3JlcGxhY2VfZmVu
Y2Uoc3luY29ianNbaV0sIE5VTEwpOwo+ICsgICAgICAgfQo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9p
ZAo+ICt2aXJ0aW9fZ3B1X2ZyZWVfcG9zdF9kZXBzKHN0cnVjdCB2aXJ0aW9fZ3B1X3N1Ym1pdF9w
b3N0X2RlcCAqcG9zdF9kZXBzLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qg
bnJfc3luY29ianMpCj4gK3sKPiArICAgICAgIHVpbnQzMl90IGkgPSBucl9zeW5jb2JqczsKPiAr
Cj4gKyAgICAgICB3aGlsZSAocG9zdF9kZXBzICYmIGktLSkgewo+ICsgICAgICAgICAgICAgICBr
ZnJlZShwb3N0X2RlcHNbaV0uY2hhaW4pOwo+ICsgICAgICAgICAgICAgICBkcm1fc3luY29ial9w
dXQocG9zdF9kZXBzW2ldLnN5bmNvYmopOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGtmcmVl
KHBvc3RfZGVwcyk7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgdmlydGlvX2dwdV9wYXJzZV9wb3N0
X2RlcHMoc3RydWN0IHZpcnRpb19ncHVfc3VibWl0ICpzdWJtaXQpCj4gK3sKPiArICAgICAgIHN0
cnVjdCBkcm1fdmlydGdwdV9leGVjYnVmZmVyICpleGJ1ZiA9IHN1Ym1pdC0+ZXhidWY7Cj4gKyAg
ICAgICBzdHJ1Y3QgZHJtX3ZpcnRncHVfZXhlY2J1ZmZlcl9zeW5jb2JqIHN5bmNvYmpfZGVzYzsK
PiArICAgICAgIHN0cnVjdCB2aXJ0aW9fZ3B1X3N1Ym1pdF9wb3N0X2RlcCAqcG9zdF9kZXBzOwo+
ICsgICAgICAgc2l6ZV90IHN5bmNvYmpfc3RyaWRlID0gZXhidWYtPnN5bmNvYmpfc3RyaWRlOwo+
ICsgICAgICAgaW50IHJldCA9IDAsIGk7Cj4gKwo+ICsgICAgICAgaWYgKCFzdWJtaXQtPm51bV9v
dXRfc3luY29ianMpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsKPiArICAgICAgIHBv
c3RfZGVwcyA9IGtjYWxsb2Moc3VibWl0LT5udW1fb3V0X3N5bmNvYmpzLCBzaXplb2YoKnBvc3Rf
ZGVwcyksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIEdGUF9LRVJORUwgfCBfX0dGUF9O
T1dBUk4gfCBfX0dGUF9OT1JFVFJZKTsKPiArICAgICAgIGlmICghcG9zdF9kZXBzKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiArCj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwg
c3VibWl0LT5udW1fb3V0X3N5bmNvYmpzOyBpKyspIHsKPiArICAgICAgICAgICAgICAgdWludDY0
X3QgYWRkcmVzcyA9IGV4YnVmLT5vdXRfc3luY29ianMgKyBpICogc3luY29ial9zdHJpZGU7Cj4g
Kwo+ICsgICAgICAgICAgICAgICBpZiAoY29weV9mcm9tX3VzZXIoJnN5bmNvYmpfZGVzYywKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHU2NF90b191c2VyX3B0cihhZGRyZXNz
KSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1pbihzeW5jb2JqX3N0cmlk
ZSwgc2l6ZW9mKHN5bmNvYmpfZGVzYykpKSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJl
dCA9IC1FRkFVTFQ7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAg
ICAgICAgIH0KPiArCj4gKyAgICAgICAgICAgICAgIHBvc3RfZGVwc1tpXS5wb2ludCA9IHN5bmNv
YmpfZGVzYy5wb2ludDsKPiArCj4gKyAgICAgICAgICAgICAgIGlmIChzeW5jb2JqX2Rlc2MuZmxh
Z3MpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgICAgICAgICB9Cj4gKwo+ICsgICAgICAg
ICAgICAgICBpZiAoc3luY29ial9kZXNjLnBvaW50KSB7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcG9zdF9kZXBzW2ldLmNoYWluID0gZG1hX2ZlbmNlX2NoYWluX2FsbG9jKCk7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKCFwb3N0X2RlcHNbaV0uY2hhaW4pIHsKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1FTk9NRU07Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgICAgICAgICAgICAgICAgICB9Cj4gKyAgICAg
ICAgICAgICAgIH0KPiArCj4gKyAgICAgICAgICAgICAgIHBvc3RfZGVwc1tpXS5zeW5jb2JqID0K
PiArICAgICAgICAgICAgICAgICAgICAgICBkcm1fc3luY29ial9maW5kKHN1Ym1pdC0+ZmlsZSwg
c3luY29ial9kZXNjLmhhbmRsZSk7Cj4gKyAgICAgICAgICAgICAgIGlmICghcG9zdF9kZXBzW2ld
LnN5bmNvYmopIHsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAg
ICB9Cj4gKwo+ICsgICAgICAgaWYgKHJldCkgewo+ICsgICAgICAgICAgICAgICB2aXJ0aW9fZ3B1
X2ZyZWVfcG9zdF9kZXBzKHBvc3RfZGVwcywgaSk7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBy
ZXQ7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgc3VibWl0LT5wb3N0X2RlcHMgPSBwb3N0X2Rl
cHM7Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkCj4gK3Zp
cnRpb19ncHVfcHJvY2Vzc19wb3N0X2RlcHMoc3RydWN0IHZpcnRpb19ncHVfc3VibWl0ICpzdWJt
aXQpCj4gK3sKPiArICAgICAgIHN0cnVjdCB2aXJ0aW9fZ3B1X3N1Ym1pdF9wb3N0X2RlcCAqcG9z
dF9kZXBzID0gc3VibWl0LT5wb3N0X2RlcHM7Cj4gKyAgICAgICBzdHJ1Y3QgZG1hX2ZlbmNlICpm
ZW5jZSA9ICZzdWJtaXQtPm91dF9mZW5jZS0+ZjsKPiArICAgICAgIHVpbnQzMl90IGk7Cj4gKwo+
ICsgICAgICAgZm9yIChpID0gMDsgcG9zdF9kZXBzICYmIGkgPCBzdWJtaXQtPm51bV9vdXRfc3lu
Y29ianM7IGkrKykgewo+ICsgICAgICAgICAgICAgICBpZiAocG9zdF9kZXBzW2ldLmNoYWluKSB7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZHJtX3N5bmNvYmpfYWRkX3BvaW50KHBvc3RfZGVw
c1tpXS5zeW5jb2JqLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwb3N0X2RlcHNbaV0uY2hhaW4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGZlbmNlLCBwb3N0X2RlcHNbaV0ucG9pbnQpOwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHBvc3RfZGVwc1tpXS5jaGFpbiA9IE5VTEw7Cj4gKyAgICAgICAgICAgICAg
IH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZHJtX3N5bmNvYmpfcmVwbGFjZV9m
ZW5jZShwb3N0X2RlcHNbaV0uc3luY29iaiwgZmVuY2UpOwo+ICsgICAgICAgICAgICAgICB9Cj4g
KyAgICAgICB9Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9mZW5jZV9ldmVudF9j
cmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2aXJ0aW9fZ3B1X2ZlbmNlICpmZW5jZSwK
PiBAQCAtMTIxLDYgKzMxNiwxMSBAQCBzdGF0aWMgaW50IHZpcnRpb19ncHVfaW5pdF9zdWJtaXRf
YnVmbGlzdChzdHJ1Y3QgdmlydGlvX2dwdV9zdWJtaXQgKnN1Ym1pdCkKPgo+ICBzdGF0aWMgdm9p
ZCB2aXJ0aW9fZ3B1X2NsZWFudXBfc3VibWl0KHN0cnVjdCB2aXJ0aW9fZ3B1X3N1Ym1pdCAqc3Vi
bWl0KQo+ICB7Cj4gKyAgICAgICB2aXJ0aW9fZ3B1X3Jlc2V0X3N5bmNvYmpzKHN1Ym1pdC0+aW5f
c3luY29ianMsIHN1Ym1pdC0+bnVtX2luX3N5bmNvYmpzKTsKPiArICAgICAgIHZpcnRpb19ncHVf
ZnJlZV9zeW5jb2JqcyhzdWJtaXQtPmluX3N5bmNvYmpzLCBzdWJtaXQtPm51bV9pbl9zeW5jb2Jq
cyk7Cj4gKyAgICAgICB2aXJ0aW9fZ3B1X2ZyZWVfcG9zdF9kZXBzKHN1Ym1pdC0+cG9zdF9kZXBz
LCBzdWJtaXQtPm51bV9vdXRfc3luY29ianMpOwo+ICsgICAgICAga2ZyZWUoc3VibWl0LT5pbl9m
ZW5jZV9pZHMpOwo+ICsKPiAgICAgICAgIGlmICghSVNfRVJSKHN1Ym1pdC0+YnVmKSkKPiAgICAg
ICAgICAgICAgICAga3ZmcmVlKHN1Ym1pdC0+YnVmKTsKPgo+IEBAIC0xNzMsNiArMzczLDggQEAg
c3RhdGljIGludCB2aXJ0aW9fZ3B1X2luaXRfc3VibWl0KHN0cnVjdCB2aXJ0aW9fZ3B1X3N1Ym1p
dCAqc3VibWl0LAo+ICAgICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+ICAgICAgICAgfQo+Cj4g
KyAgICAgICBzdWJtaXQtPm51bV9vdXRfc3luY29ianMgPSBleGJ1Zi0+bnVtX291dF9zeW5jb2Jq
czsKPiArICAgICAgIHN1Ym1pdC0+bnVtX2luX3N5bmNvYmpzID0gZXhidWYtPm51bV9pbl9zeW5j
b2JqczsKPiAgICAgICAgIHN1Ym1pdC0+b3V0X2ZlbmNlID0gb3V0X2ZlbmNlOwo+ICAgICAgICAg
c3VibWl0LT5mZW5jZV9jdHggPSBmZW5jZV9jdHg7Cj4gICAgICAgICBzdWJtaXQtPnJpbmdfaWR4
ID0gcmluZ19pZHg7Cj4gQEAgLTI4NSw2ICs0ODcsMTQgQEAgaW50IHZpcnRpb19ncHVfZXhlY2J1
ZmZlcl9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAo+ICAgICAgICAg
aWYgKHJldCkKPiAgICAgICAgICAgICAgICAgZ290byBjbGVhbnVwOwo+Cj4gKyAgICAgICByZXQg
PSB2aXJ0aW9fZ3B1X3BhcnNlX2RlcHMoJnN1Ym1pdCk7Cj4gKyAgICAgICBpZiAocmV0KQo+ICsg
ICAgICAgICAgICAgICBnb3RvIGNsZWFudXA7Cj4gKwo+ICsgICAgICAgcmV0ID0gdmlydGlvX2dw
dV9wYXJzZV9wb3N0X2RlcHMoJnN1Ym1pdCk7Cj4gKyAgICAgICBpZiAocmV0KQo+ICsgICAgICAg
ICAgICAgICBnb3RvIGNsZWFudXA7Cj4gKwo+ICAgICAgICAgcmV0ID0gdmlydGlvX2dwdV9pbnN0
YWxsX291dF9mZW5jZV9mZCgmc3VibWl0KTsKPiAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAg
ICAgICAgIGdvdG8gY2xlYW51cDsKPiBAQCAtMjk0LDYgKzUwNCw3IEBAIGludCB2aXJ0aW9fZ3B1
X2V4ZWNidWZmZXJfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiAg
ICAgICAgICAgICAgICAgZ290byBjbGVhbnVwOwo+Cj4gICAgICAgICB2aXJ0aW9fZ3B1X3N1Ym1p
dCgmc3VibWl0KTsKPiArICAgICAgIHZpcnRpb19ncHVfcHJvY2Vzc19wb3N0X2RlcHMoJnN1Ym1p
dCk7Cj4gICAgICAgICB2aXJ0aW9fZ3B1X2NvbXBsZXRlX3N1Ym1pdCgmc3VibWl0KTsKPiAgY2xl
YW51cDoKPiAgICAgICAgIHZpcnRpb19ncHVfY2xlYW51cF9zdWJtaXQoJnN1Ym1pdCk7Cj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vdmlydGdwdV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9k
cm0vdmlydGdwdV9kcm0uaAo+IGluZGV4IDdiMTU4ZmNiMDJiNC4uY2U0OTQ4YWFjYWZkIDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vdmlydGdwdV9kcm0uaAo+ICsrKyBiL2luY2x1ZGUv
dWFwaS9kcm0vdmlydGdwdV9kcm0uaAo+IEBAIC02NCw2ICs2NCwxNiBAQCBzdHJ1Y3QgZHJtX3Zp
cnRncHVfbWFwIHsKPiAgICAgICAgIF9fdTMyIHBhZDsKPiAgfTsKPgo+ICsjZGVmaW5lIFZJUlRH
UFVfRVhFQ0JVRl9TWU5DT0JKX1JFU0VUICAgICAgICAgIDB4MDEKPiArI2RlZmluZSBWSVJUR1BV
X0VYRUNCVUZfU1lOQ09CSl9GTEFHUyAoIFwKPiArICAgICAgICAgICAgICAgVklSVEdQVV9FWEVD
QlVGX1NZTkNPQkpfUkVTRVQgfCBcCj4gKyAgICAgICAgICAgICAgIDApCj4gK3N0cnVjdCBkcm1f
dmlydGdwdV9leGVjYnVmZmVyX3N5bmNvYmogewo+ICsgICAgICAgX191MzIgaGFuZGxlOwo+ICsg
ICAgICAgX191MzIgZmxhZ3M7Cj4gKyAgICAgICBfX3U2NCBwb2ludDsKPiArfTsKPiArCj4gIC8q
IGZlbmNlX2ZkIGlzIG1vZGlmaWVkIG9uIHN1Y2Nlc3MgaWYgVklSVEdQVV9FWEVDQlVGX0ZFTkNF
X0ZEX09VVCBmbGFnIGlzIHNldC4gKi8KPiAgc3RydWN0IGRybV92aXJ0Z3B1X2V4ZWNidWZmZXIg
ewo+ICAgICAgICAgX191MzIgZmxhZ3M7Cj4gQEAgLTczLDcgKzgzLDExIEBAIHN0cnVjdCBkcm1f
dmlydGdwdV9leGVjYnVmZmVyIHsKPiAgICAgICAgIF9fdTMyIG51bV9ib19oYW5kbGVzOwo+ICAg
ICAgICAgX19zMzIgZmVuY2VfZmQ7IC8qIGluL291dCBmZW5jZSBmZCAoc2VlIFZJUlRHUFVfRVhF
Q0JVRl9GRU5DRV9GRF9JTi9PVVQpICovCj4gICAgICAgICBfX3UzMiByaW5nX2lkeDsgLyogY29t
bWFuZCByaW5nIGluZGV4IChzZWUgVklSVEdQVV9FWEVDQlVGX1JJTkdfSURYKSAqLwo+IC0gICAg
ICAgX191MzIgcGFkOwo+ICsgICAgICAgX191MzIgc3luY29ial9zdHJpZGU7Cj4gKyAgICAgICBf
X3UzMiBudW1faW5fc3luY29ianM7Cj4gKyAgICAgICBfX3UzMiBudW1fb3V0X3N5bmNvYmpzOwo+
ICsgICAgICAgX191NjQgaW5fc3luY29ianM7Cj4gKyAgICAgICBfX3U2NCBvdXRfc3luY29ianM7
Cj4gIH07Cj4KPiAgI2RlZmluZSBWSVJUR1BVX1BBUkFNXzNEX0ZFQVRVUkVTIDEgLyogZG8gd2Ug
aGF2ZSAzRCBmZWF0dXJlcyBpbiB0aGUgaHcgKi8KPiAtLQo+IDIuMzkuMgo+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
