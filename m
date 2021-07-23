Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6643D33B7
	for <lists.virtualization@lfdr.de>; Fri, 23 Jul 2021 06:26:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9DFD6064D;
	Fri, 23 Jul 2021 04:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eH4YvPtbM-Ot; Fri, 23 Jul 2021 04:25:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 820F66064F;
	Fri, 23 Jul 2021 04:25:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 034C5C001F;
	Fri, 23 Jul 2021 04:25:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78897C000E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Jul 2021 04:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59D6A82AA2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Jul 2021 04:25:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OTqv0wQpYxQa
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Jul 2021 04:25:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F11B282A28
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Jul 2021 04:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627014347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pwx2jiw3f4szZ28cbb3oIdrtGZO1V/F88lfv0x/76r4=;
 b=GePERyy0jhGiHd4wNisMp7eHGEwp4djXdAuBq24xmQ/+0nEME2XgyHIZIZIixhBwLHZLqR
 hz3EbCkLQkHTAjmquDyJeeioOlI6GzJspZWDQ9CZiGTKXwB3tB0zlGw5VgbWCMjrhV8xK+
 kpOeLbXySIQaUQDKEwM0KHLm6svebJE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-CCUGZhYcPTGzG5CDmiJpKw-1; Fri, 23 Jul 2021 00:25:45 -0400
X-MC-Unique: CCUGZhYcPTGzG5CDmiJpKw-1
Received: by mail-pl1-f200.google.com with SMTP id
 s3-20020a1709029883b029012b41197000so1085198plp.16
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Jul 2021 21:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pwx2jiw3f4szZ28cbb3oIdrtGZO1V/F88lfv0x/76r4=;
 b=ltRyqK5klAGSn85WjOlpbF6aKLUD+H7Jbaa7lH2nP6Y/tsZvsS4L8VkzWNGpViD3tN
 2LA3gLGha2hUw895OLNzJWeK3EcSX3r52cVqnY5FBd4N7sbLd2wGll7HjkdMX4pboZcL
 V2KPpLyJSKULx0cAMH/7HO9mXMSx1LwOoqcaBh+semDvSp8fPTDPYkpwGuiKsbcXg5de
 TGHPGzXoPAtkR50C7Vmgcv4mDI9VGGYf6xVFQZgSpDjJLOc8jPdq/A+tfL0rkqzA9ZUt
 mYUST3bT9eVtjyGWDQsATAY+BTQ3fV5LLv8UJGhtRLipzl7WAnXSwg5JTf/IqdjsjZwF
 25HA==
X-Gm-Message-State: AOAM530bxPQYfk8wwXI64cBrZ55hterhC0siN6Ptk//gvV8dYGdxwceM
 QozkitXGfdPMJhq06wjhquNbnQ3AyQHARnmOSTPBYZOF2i0eI2j9RBO9izr5Fe7Dwn3A0u5Ft3x
 bn0N/cQyF/JLJtGingMzICXh4LhVdaagyJI2E3RGrDssJJlucT424lGNPFtz/Gv7qImt6aQ2YQZ
 mYUHw+wUNQEO+82SZB3g==
X-Received: by 2002:a63:1266:: with SMTP id 38mr3220251pgs.154.1627014344526; 
 Thu, 22 Jul 2021 21:25:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1Wq6v2GA1XHiHviQ/feeMBqpIMuk7r+/D4JildUX2BDo0U5jbPC3jQEhBFu5OaqDT1z8scA==
X-Received: by 2002:a63:1266:: with SMTP id 38mr3220224pgs.154.1627014344189; 
 Thu, 22 Jul 2021 21:25:44 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id gb10sm4499006pjb.43.2021.07.22.21.25.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 21:25:43 -0700 (PDT)
Subject: Re: PROBLEM: virtio_net LRO kernel panics
To: Ivan <ivan@prestigetransportation.com>
References: <CACFia2dwacaVVYD+1uG=CDGaJqdCOSBvZ5FcXp04caecaWAY3w@mail.gmail.com>
 <CAMDZJNXthLpAPHn62gA1qSmfLOoDFcFGdgnNwW6yA+wjn0FjgQ@mail.gmail.com>
 <CACFia2fDZHUZB5wJ7LK8M2sv_+W58rHw0NzzrwPPoX9=s7yPdQ@mail.gmail.com>
 <9547a9e5-738c-2009-a2af-66173d305c2d@redhat.com>
 <CACFia2eLCJuy=w1r20691s_cSYkBkPaY-Dbd-9CkrcpSAe7z6g@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5fd9c67f-d900-7694-f0a8-62682c8a14c8@redhat.com>
Date: Fri, 23 Jul 2021 12:25:36 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CACFia2eLCJuy=w1r20691s_cSYkBkPaY-Dbd-9CkrcpSAe7z6g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: "David S. Miller" <davem@davemloft.net>,
 virtualization@lists.linux-foundation.org,
 Willem de Bruijn <willemb@google.com>, "Michael S. Tsirkin" <mst@redhat.com>
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CuWcqCAyMDIxLzcvMjMg5LiK5Y2IMTA6NTQsIEl2YW4g5YaZ6YGTOgo+IE9uIFRodSwgSnVsIDIy
LCAyMDIxIGF0IDk6MzcgUE0gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6
Cj4+Cj4+IOWcqCAyMDIxLzcvMjMg5LiK5Y2IOTo0MCwgSXZhbiDlhpnpgZM6Cj4+PiBPbiBUaHUs
IEp1bCAyMiwgMjAyMSBhdCA4OjI4IFBNIFRvbmdoYW8gWmhhbmc8eGlhbmd4aWEubS55dWVAZ21h
aWwuY29tPiAgd3JvdGU6Cj4+Pj4gd2hhdCBpcyB5b3VyIGtlcm5lbCB2ZXJzaW9uLCBhbmQgZmVh
dHVyZXMgb2YgeW91ciBuZXRkZXZpY2UKPj4+IEN1cnJlbnRseSwgNS4xMy40LiAgQnV0IEkgYWxz
byB0ZXN0ZWQgd2l0aCBrZXJuZWxzIGJhY2sgdG8gNS4xMCwgYW5kCj4+PiBpdCBhbHdheXMgcGFu
aWNzLiAgSSBhbHNvIGRvd25sb2FkZWQgdGhlIHN0b2NrIGdlbmVyaWMga2VybmVsIGZyb20KPj4+
IFNsYWNrd2FyZSwgYW5kIGl0IHRvbyBwYW5pY2tlZC4KPj4+Cj4+PiAwIHJvb3RATnVSYWlkOn4j
IGV0aHRvb2wgLWsgZXRoMAo+Pj4gRmVhdHVyZXMgZm9yIGV0aDA6Cj4+PiByeC1jaGVja3N1bW1p
bmc6IG9uIFtmaXhlZF0KPj4+IHR4LWNoZWNrc3VtbWluZzogb24KPj4+ICAgICAgICAgICB0eC1j
aGVja3N1bS1pcHY0OiBvZmYgW2ZpeGVkXQo+Pj4gICAgICAgICAgIHR4LWNoZWNrc3VtLWlwLWdl
bmVyaWM6IG9uCj4+PiAgICAgICAgICAgdHgtY2hlY2tzdW0taXB2Njogb2ZmIFtmaXhlZF0KPj4+
ICAgICAgICAgICB0eC1jaGVja3N1bS1mY29lLWNyYzogb2ZmIFtmaXhlZF0KPj4+ICAgICAgICAg
ICB0eC1jaGVja3N1bS1zY3RwOiBvZmYgW2ZpeGVkXQo+Pj4gc2NhdHRlci1nYXRoZXI6IG9uCj4+
PiAgICAgICAgICAgdHgtc2NhdHRlci1nYXRoZXI6IG9uCj4+PiAgICAgICAgICAgdHgtc2NhdHRl
ci1nYXRoZXItZnJhZ2xpc3Q6IG9mZiBbZml4ZWRdCj4+PiB0Y3Atc2VnbWVudGF0aW9uLW9mZmxv
YWQ6IG9uCj4+PiAgICAgICAgICAgdHgtdGNwLXNlZ21lbnRhdGlvbjogb24KPj4+ICAgICAgICAg
ICB0eC10Y3AtZWNuLXNlZ21lbnRhdGlvbjogb2ZmIFtmaXhlZF0KPj4+ICAgICAgICAgICB0eC10
Y3AtbWFuZ2xlaWQtc2VnbWVudGF0aW9uOiBvZmYKPj4+ICAgICAgICAgICB0eC10Y3A2LXNlZ21l
bnRhdGlvbjogb24KPj4+IGdlbmVyaWMtc2VnbWVudGF0aW9uLW9mZmxvYWQ6IG9uCj4+PiBnZW5l
cmljLXJlY2VpdmUtb2ZmbG9hZDogb24KPj4+IGxhcmdlLXJlY2VpdmUtb2ZmbG9hZDogb24gW2Zp
eGVkXQo+Pgo+PiBEb2VzIGl0IHdvcmsgaWYgeW91IHR1cm4gb2ZmIGxybyBiZWZvcmUgZW5hYmxp
bmcgdGhlIGZvcndhcmRpbmc/Cj4+Cj4+IEJ0dywgdXNpbmcgTFJPIGZvciB2aXJ0aW8tbmV0IGlz
IHN1c3BpY2lvdXMsIGl0J3MgYWN0dWFsbHkgdGhlIEdTTyBpbgo+PiB0aGUgUlggcGF0Y2ggbm90
IExSTy4KPiBBcyBJIG1lbnRpb24sIGl0J3MgYSBmcmVzaGx5IGJvb3RlZCBzeXN0ZW0gb24gd2hp
Y2ggSSBoYXZlIG5vdCBtYWRlCj4gYW55IHNldHRpbmcgY2hhbmdlcyB3aXRoIGV0aHRvb2wgb3Ig
c3lzY3RsLiAoU28sIHdoYXRldmVyIHRoZSBrZXJuZWwKPiBkZWZhdWx0cyBhcmUpCj4KPiBQZXIg
eW91ciBzdWdnZXN0aW9uOgo+Cj4gMCByb290QE51UmFpZDp+IyBldGh0b29sIC1LIGV0aDAgbHJv
IG9mZgo+IEFjdHVhbCBjaGFuZ2VzOgo+IHJ4LWxybzogb24gW3JlcXVlc3RlZCBvZmZdCj4gQ291
bGQgbm90IGNoYW5nZSBhbnkgZGV2aWNlIGZlYXR1cmVzCj4gMSByb290QE51UmFpZDp+IwoKCk9r
LCBpdCBsb29rcyBsaWtlIHRoZSBkZXZpY2UgbWlzc2VzIHRoZSBWSVJUSU9fTkVUX0ZfQ1RSTF9H
VUVTVF9PRkZMT0FEUyAKd2hpY2ggbWFrZXMgaXQgaW1wb3NzaWJsZSB0byBjaGFuZ2UgdGhlIExS
TyBzZXR0aW5nLgoKRGlkIHlvdSB1c2UgcWVtdT8gSWYgeWVzLCB3aGF0J3MgdGhlIHFlbXUgdmVy
c2lvbiB5b3UndmUgdXNlZD8KClRoYW5rcwoKCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
