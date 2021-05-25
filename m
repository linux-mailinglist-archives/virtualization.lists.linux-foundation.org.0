Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AF238FAEF
	for <lists.virtualization@lfdr.de>; Tue, 25 May 2021 08:30:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FA3483C07;
	Tue, 25 May 2021 06:30:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QhjpD9LY2Tqu; Tue, 25 May 2021 06:30:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AB0383C12;
	Tue, 25 May 2021 06:30:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4FE2C0024;
	Tue, 25 May 2021 06:30:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB54DC0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 06:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2281607B8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 06:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hEZFaZvOzDwV
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 06:30:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EBED6071B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 06:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621924237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pIPfv8IYDUTIDMiq+eRnmm+3Pp4NwYwr+GrjUyUW4n4=;
 b=TWuY5OXDRJMgGKWghOHwy0Z8mFsEuZWkzYs8+l/HlYQc1QqyaqDHouR0RUW7VHtaudHPv+
 ueXzyzeMxFTDNUu8HvhRpGdXbZtnFbrKMTOSMks1czA8OoyfwhrFLP7ENoFbrfutUnEIFw
 R7TtF781zv82X4roMvHmCCGk6Y9jkTo=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-0mtkJ7jEMKiWChJgdXlYJw-1; Tue, 25 May 2021 02:30:36 -0400
X-MC-Unique: 0mtkJ7jEMKiWChJgdXlYJw-1
Received: by mail-pj1-f71.google.com with SMTP id
 w1-20020a17090a0281b0290156f7df20a0so15043093pja.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 May 2021 23:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pIPfv8IYDUTIDMiq+eRnmm+3Pp4NwYwr+GrjUyUW4n4=;
 b=JWADwb4FNyO3ujvtLpR0OFmXSQy4nj8hlO0UWQm4WkEh3+5sPyN+cx8OCDpmwcpc8+
 rQa8seVfFw/I070KikX/xazicLHNwPvrcT0mqm/pTtsSUYXP5MkCvIwUc6IGrr9NqCsj
 pyE7YPMEqR7FPTNO2MJvAeNhsAKrsU03m4SSEsDABh3W1WJ7UQ/G/EgBMOjzZ/PlC8Hb
 1aEV/l1rG9eVYqdIJW3+6wkl6/u0cLvfXrEIZUdOoA7E6tPjxWCOD8S0BEwmoD+yvHpL
 RakhpNTwHOdPxyvvH0GnWey2fXcDU/0hX/WTh9pv6xkfuq4Cb3A1Vr+fLc89Xj5VhDon
 /QXA==
X-Gm-Message-State: AOAM531rRKI38jKJ0fPZM/EmIc66t5Cu7KV+b6FLgqRdsj8dcBcPkhSO
 z4kVTx06CulTquHjg0TwpKEkWcrpNlEWeZmMA1jOP0jnXkUBt1x/ITIoyP+fB/IslbhWXTDo94q
 5rGIXa8RbEXu6CwXPycIRTy1OuUN5VS53Rb+R3ASU9g==
X-Received: by 2002:aa7:80d3:0:b029:28e:f117:4961 with SMTP id
 a19-20020aa780d30000b029028ef1174961mr29062273pfn.37.1621924234929; 
 Mon, 24 May 2021 23:30:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjxp4RjmBg//wxUGNw5gB2804G2bqHAHLpl0rtSt4C2hFIH3k1hJTSLGBvAz9QuuJ5ei26BA==
X-Received: by 2002:aa7:80d3:0:b029:28e:f117:4961 with SMTP id
 a19-20020aa780d30000b029028ef1174961mr29062259pfn.37.1621924234638; 
 Mon, 24 May 2021 23:30:34 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id g202sm13245651pfb.54.2021.05.24.23.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 23:30:34 -0700 (PDT)
Subject: Re: [PATCH] virtio-net: Add validation for used length
To: Xie Yongji <xieyongji@bytedance.com>, mst@redhat.com
References: <20210525045838.1137-1-xieyongji@bytedance.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <75e26cf1-6ee8-108c-ff48-8a23345b3ccc@redhat.com>
Date: Tue, 25 May 2021 14:30:27 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210525045838.1137-1-xieyongji@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CtTaIDIwMjEvNS8yNSDPws7nMTI6NTgsIFhpZSBZb25namkg0LS1wDoKPiBUaGlzIGFkZHMgdmFs
aWRhdGlvbiBmb3IgdXNlZCBsZW5ndGggKG1pZ2h0IGNvbWUKPiBmcm9tIGFuIHVudHJ1c3RlZCBk
ZXZpY2UpIHRvIGF2b2lkIGRhdGEgY29ycnVwdGlvbgo+IG9yIGxvc3MuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBYaWUgWW9uZ2ppIDx4aWV5b25namlAYnl0ZWRhbmNlLmNvbT4KPiAtLS0KPiAgIGRyaXZl
cnMvbmV0L3ZpcnRpb19uZXQuYyB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKPiAgIDEgZmls
ZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
dmlydGlvX25ldC5jIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gaW5kZXggYzQ3MTFlMjNh
Zjg4Li4yZGNkYzFhM2M3ZTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvdmlydGlvX25ldC5j
Cj4gKysrIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gQEAgLTY2OCw2ICs2NjgsMTMgQEAg
c3RhdGljIHN0cnVjdCBza19idWZmICpyZWNlaXZlX3NtYWxsKHN0cnVjdCBuZXRfZGV2aWNlICpk
ZXYsCj4gICAJCXZvaWQgKm9yaWdfZGF0YTsKPiAgIAkJdTMyIGFjdDsKPiAgIAo+ICsJCWlmICh1
bmxpa2VseShsZW4gPiBHT09EX1BBQ0tFVF9MRU4pKSB7Cj4gKwkJCXByX2RlYnVnKCIlczogcngg
ZXJyb3I6IGxlbiAldSBleGNlZWRzIG1heCBzaXplICVsdVxuIiwKPiArCQkJCSBkZXYtPm5hbWUs
IGxlbiwgR09PRF9QQUNLRVRfTEVOKTsKPiArCQkJZGV2LT5zdGF0cy5yeF9sZW5ndGhfZXJyb3Jz
Kys7Cj4gKwkJCWdvdG8gZXJyX3hkcDsKPiArCQl9CgoKTmVlZCB0byBjb3VudCB2aS0+aGRyX2xl
biBoZXJlPwoKCj4gKwo+ICAgCQlpZiAodW5saWtlbHkoaGRyLT5oZHIuZ3NvX3R5cGUpKQo+ICAg
CQkJZ290byBlcnJfeGRwOwo+ICAgCj4gQEAgLTczOSw2ICs3NDYsMTQgQEAgc3RhdGljIHN0cnVj
dCBza19idWZmICpyZWNlaXZlX3NtYWxsKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsCj4gICAJfQo+
ICAgCXJjdV9yZWFkX3VubG9jaygpOwo+ICAgCj4gKwlpZiAodW5saWtlbHkobGVuID4gR09PRF9Q
QUNLRVRfTEVOKSkgewo+ICsJCXByX2RlYnVnKCIlczogcnggZXJyb3I6IGxlbiAldSBleGNlZWRz
IG1heCBzaXplICVsdVxuIiwKPiArCQkJIGRldi0+bmFtZSwgbGVuLCBHT09EX1BBQ0tFVF9MRU4p
Owo+ICsJCWRldi0+c3RhdHMucnhfbGVuZ3RoX2Vycm9ycysrOwo+ICsJCXB1dF9wYWdlKHBhZ2Up
Owo+ICsJCXJldHVybiBOVUxMOwo+ICsJfQo+ICsKPiAgIAlza2IgPSBidWlsZF9za2IoYnVmLCBi
dWZsZW4pOwo+ICAgCWlmICghc2tiKSB7Cj4gICAJCXB1dF9wYWdlKHBhZ2UpOwo+IEBAIC04MjIs
NiArODM3LDEzIEBAIHN0YXRpYyBzdHJ1Y3Qgc2tfYnVmZiAqcmVjZWl2ZV9tZXJnZWFibGUoc3Ry
dWN0IG5ldF9kZXZpY2UgKmRldiwKPiAgIAkJdm9pZCAqZGF0YTsKPiAgIAkJdTMyIGFjdDsKPiAg
IAo+ICsJCWlmICh1bmxpa2VseShsZW4gPiB0cnVlc2l6ZSkpIHsKPiArCQkJcHJfZGVidWcoIiVz
OiByeCBlcnJvcjogbGVuICV1IGV4Y2VlZHMgdHJ1ZXNpemUgJWx1XG4iLAo+ICsJCQkJIGRldi0+
bmFtZSwgbGVuLCAodW5zaWduZWQgbG9uZyljdHgpOwo+ICsJCQlkZXYtPnN0YXRzLnJ4X2xlbmd0
aF9lcnJvcnMrKzsKPiArCQkJZ290byBlcnJfeGRwOwo+ICsJCX0KCgpUaGVyZSdzIGEgc2ltaWxh
ciBjaGVjayBhZnRlciB0aGUgWERQLCBsZXQncyBzaW1wbHkgbW92ZSBpdCBoZXJlPwoKQW5kIGRv
IHdlIG5lZWQgc2ltaWxhciBjaGVjayBpbiByZWNlaXZlX2JpZygpPwoKVGhhbmtzCgoKPiArCj4g
ICAJCS8qIFRyYW5zaWVudCBmYWlsdXJlIHdoaWNoIGluIHRoZW9yeSBjb3VsZCBvY2N1ciBpZgo+
ICAgCQkgKiBpbi1mbGlnaHQgcGFja2V0cyBmcm9tIGJlZm9yZSBYRFAgd2FzIGVuYWJsZWQgcmVh
Y2gKPiAgIAkJICogdGhlIHJlY2VpdmUgcGF0aCBhZnRlciBYRFAgaXMgbG9hZGVkLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxp
emF0aW9u
