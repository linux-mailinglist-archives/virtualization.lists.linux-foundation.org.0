Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBB538F80E
	for <lists.virtualization@lfdr.de>; Tue, 25 May 2021 04:23:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B93104018A;
	Tue, 25 May 2021 02:23:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cwC85OjZBEJI; Tue, 25 May 2021 02:23:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 527F54018C;
	Tue, 25 May 2021 02:23:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D53A8C0024;
	Tue, 25 May 2021 02:23:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC45FC0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 02:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B391E83BD6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 02:23:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3CXyi18tov9j
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 02:23:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBEDA82C89
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 02:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621909431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pA/QwPywSWTHg158KqGHIXsGw9/je8wyRbMc2/UDcTk=;
 b=ZgDC0thzPH0b8KZIUTWuC2WiGfkDZq6B8B+FwKro2xZBmOP1Km+GCDtmhglbHdBuJbdF/q
 /E5dXq0z5hS7ziHynGDZ3Om8sjTCEhHld2YRxutBKPN1nJ6BoO6i9oDwhNjKptmt7R1RH4
 FjsxB7XF9IAjakKntQQ5kG8xjqK6fIw=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-iKu92I83O9Wg2BVZbNYZ5A-1; Mon, 24 May 2021 22:23:49 -0400
X-MC-Unique: iKu92I83O9Wg2BVZbNYZ5A-1
Received: by mail-pf1-f198.google.com with SMTP id
 h185-20020a6283c20000b02902d40a248917so19428070pfe.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 May 2021 19:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pA/QwPywSWTHg158KqGHIXsGw9/je8wyRbMc2/UDcTk=;
 b=HDM6+uy3dUHJ4qonUg+oj4kEPPRdb1YLCbteI1IU+gsEk0nBjVsG85GngFsfKNcTXV
 PFgZtd34/9c+QoKMk1Y9ACfmJ9T0iXsFKNmbo0w/b4+fvaufdZ8hwlpte/VZ+0kRNucK
 7/dSURnnoA7tAnZph8zVeaXg6V1BXbQ5MBLaagF38+nlaeLAXluu+Y4XEEwz7PoyGxqI
 5BxYER+qL+XF//w8NJ/SA0gZEF3SV2xcmcLuvLt2hF57x5aqsvfrM8X4R8ibw5DCvZaa
 Q/89jyQQHXd5PKxLDxzT+JLhZ3vTvwmYtpW9K606a5B+Sk4EEV6KpDRsYCbk1IJDhxYa
 dASQ==
X-Gm-Message-State: AOAM530vxNG6AaKlrWpn1YWkFbOUT66qkRwZKnCD5TzqswOe74FDxvMl
 G608QiISJlF5VRW/GnwYIBeydu+e06udYSv+x7RwiJh/5zN8cE1eyoBzqeFCc+XDBHTovvDvpeb
 qgrv+p0Ku/cyZNIaIccVyIW0UATNOXdop8nwL6jNFzA==
X-Received: by 2002:a63:fc11:: with SMTP id j17mr16218470pgi.355.1621909428729; 
 Mon, 24 May 2021 19:23:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoau2gtzCYKkkHEUElyjNoBWmK5Hyy0SWIBWDEmY6XbWsJabWGUYCvDE2GIyPl+Z1OhgooGA==
X-Received: by 2002:a63:fc11:: with SMTP id j17mr16218447pgi.355.1621909428470; 
 Mon, 24 May 2021 19:23:48 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id c1sm8206959pfo.181.2021.05.24.19.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 19:23:48 -0700 (PDT)
Subject: Re: [PATCH 1/3] virtio: add virtioqueue_more_used()
To: Stefan Hajnoczi <stefanha@redhat.com>,
 virtualization@lists.linux-foundation.org
References: <20210520141305.355961-1-stefanha@redhat.com>
 <20210520141305.355961-2-stefanha@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <dc4a4d96-53b1-5358-cfdd-61795283fd88@redhat.com>
Date: Tue, 25 May 2021 10:23:39 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210520141305.355961-2-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Jens Axboe <axboe@kernel.dk>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Christoph Hellwig <hch@lst.de>
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

CtTaIDIwMjEvNS8yMCDPws7nMTA6MTMsIFN0ZWZhbiBIYWpub2N6aSDQtLXAOgo+IEFkZCBhbiBB
UEkgdG8gY2hlY2sgd2hldGhlciB0aGVyZSBhcmUgcGVuZGluZyB1c2VkIGJ1ZmZlcnMuIFRoZXJl
IGlzCj4gYWxyZWFkeSBhIHNpbWlsYXIgQVBJIGNhbGxlZCB2aXJ0cXVldWVfcG9sbCgpIGJ1dCBp
dCBvbmx5IHdvcmtzIHRvZ2V0aGVyCj4gd2l0aCB2aXJ0cXVldWVfZW5hYmxlX2NiX3ByZXBhcmUo
KS4gVGhlIHBhdGNoZXMgdGhhdCBmb2xsb3cgYWRkIGJsay1tcQo+IC0+cG9sbCgpIHN1cHBvcnQg
dG8gdmlydGlvX2JsayBhbmQgdGhleSBuZWVkIHRvIGNoZWNrIGZvciB1c2VkIGJ1ZmZlcnMKPiB3
aXRob3V0IHJlLWVuYWJsaW5nIHZpcnRxdWV1ZSBjYWxsYmFja3MsIHNvIGludHJvZHVjZSBhbiBB
UEkgZm9yIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUBy
ZWRoYXQuY29tPgoKClR5cG8gaW4gdGhlIHN1YmplY3QuCgoKPiAtLS0KPiAgIGluY2x1ZGUvbGlu
dXgvdmlydGlvLmggICAgICAgfCAgMiArKwo+ICAgZHJpdmVycy92aXJ0aW8vdmlydGlvX3Jpbmcu
YyB8IDE3ICsrKysrKysrKysrKysrKysrCj4gICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3ZpcnRpby5oIGIvaW5jbHVkZS9s
aW51eC92aXJ0aW8uaAo+IGluZGV4IGIxODk0ZTAzMjNmYS4uYzZhZDBmMjVmNDEyIDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvbGludXgvdmlydGlvLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3ZpcnRp
by5oCj4gQEAgLTYzLDYgKzYzLDggQEAgYm9vbCB2aXJ0cXVldWVfa2lja19wcmVwYXJlKHN0cnVj
dCB2aXJ0cXVldWUgKnZxKTsKPiAgIAo+ICAgYm9vbCB2aXJ0cXVldWVfbm90aWZ5KHN0cnVjdCB2
aXJ0cXVldWUgKnZxKTsKPiAgIAo+ICtib29sIHZpcnRxdWV1ZV9tb3JlX3VzZWQoY29uc3Qgc3Ry
dWN0IHZpcnRxdWV1ZSAqdnEpOwo+ICsKPiAgIHZvaWQgKnZpcnRxdWV1ZV9nZXRfYnVmKHN0cnVj
dCB2aXJ0cXVldWUgKnZxLCB1bnNpZ25lZCBpbnQgKmxlbik7Cj4gICAKPiAgIHZvaWQgKnZpcnRx
dWV1ZV9nZXRfYnVmX2N0eChzdHJ1Y3QgdmlydHF1ZXVlICp2cSwgdW5zaWduZWQgaW50ICpsZW4s
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMgYi9kcml2ZXJzL3Zp
cnRpby92aXJ0aW9fcmluZy5jCj4gaW5kZXggNzFlMTZiNTNlOWMxLi43YzNkYTc1ZGE0NjIgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+ICsrKyBiL2RyaXZlcnMv
dmlydGlvL3ZpcnRpb19yaW5nLmMKPiBAQCAtMjAzMiw2ICsyMDMyLDIzIEBAIHN0YXRpYyBpbmxp
bmUgYm9vbCBtb3JlX3VzZWQoY29uc3Qgc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEpCj4gICAJ
cmV0dXJuIHZxLT5wYWNrZWRfcmluZyA/IG1vcmVfdXNlZF9wYWNrZWQodnEpIDogbW9yZV91c2Vk
X3NwbGl0KHZxKTsKPiAgIH0KPiAgIAo+ICsvKioKPiArICogdmlydHF1ZXVlX21vcmVfdXNlZCAt
IGNoZWNrIGlmIHRoZXJlIGFyZSB1c2VkIGJ1ZmZlcnMgcGVuZGluZwo+ICsgKiBAX3ZxOiB0aGUg
c3RydWN0IHZpcnRxdWV1ZSB3ZSdyZSB0YWxraW5nIGFib3V0Lgo+ICsgKgo+ICsgKiBSZXR1cm5z
IHRydWUgaWYgdGhlcmUgYXJlIHVzZWQgYnVmZmVycywgZmFsc2Ugb3RoZXJ3aXNlLiBNYXkgYmUg
Y2FsbGVkIGF0Cj4gKyAqIHRoZSBzYW1lIHRpbWUgYXMgb3RoZXIgdmlydHF1ZXVlIG9wZXJhdGlv
bnMsIGJ1dCBhY3R1YWxseSBjYWxsaW5nCj4gKyAqIHZpcnRxdWV1ZV9nZXRfYnVmKCkgcmVxdWly
ZXMgc2VyaWFsaXphdGlvbiBzbyBiZSBtaW5kZnVsIG9mIHRoZSByYWNlIGJldHdlZW4KPiArICog
Y2FsbGluZyB2aXJ0cXVldWVfbW9yZV91c2VkKCkgYW5kIHZpcnRxdWV1ZV9nZXRfYnVmKCkuCj4g
KyAqLwo+ICtib29sIHZpcnRxdWV1ZV9tb3JlX3VzZWQoY29uc3Qgc3RydWN0IHZpcnRxdWV1ZSAq
X3ZxKQo+ICt7Cj4gKwlzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlICp2cSA9IHRvX3Z2cShfdnEpOwo+
ICsKPiArCXJldHVybiBtb3JlX3VzZWQodnEpOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0xfR1BMKHZp
cnRxdWV1ZV9tb3JlX3VzZWQpOwoKCkl0J3Mgd29ydGggdG8gbWVudGlvbiB0aGF0IHRoZSBmdW5j
dGlvbiBpcyBub3Qgc2VyaWFsaXplZCAobm8gYmFycmllcnMpLgoKVGhhbmtzCgoKPiArCj4gICBp
cnFyZXR1cm5fdCB2cmluZ19pbnRlcnJ1cHQoaW50IGlycSwgdm9pZCAqX3ZxKQo+ICAgewo+ICAg
CXN0cnVjdCB2cmluZ192aXJ0cXVldWUgKnZxID0gdG9fdnZxKF92cSk7CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
