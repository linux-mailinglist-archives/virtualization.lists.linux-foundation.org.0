Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C7D398297
	for <lists.virtualization@lfdr.de>; Wed,  2 Jun 2021 09:05:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 857BF607F0;
	Wed,  2 Jun 2021 07:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pUAw8aEX1hst; Wed,  2 Jun 2021 07:05:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A90E6086A;
	Wed,  2 Jun 2021 07:05:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5732C0001;
	Wed,  2 Jun 2021 07:05:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 640D0C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 07:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51A5D607BA
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 07:05:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kshxCWqcfALI
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 07:05:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39C786079E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 07:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622617543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N7AFjn1kAaIwJ7yXpW9H7ltpl4fJk13y2xBWVC0JT2Y=;
 b=BtlExB+XRw/kZk2VZDI73uHGf8Gd1ppIQGTXFEmdcHZ8/X1U8rBmXCjpZjjgQm7kkWmB1N
 5wqcHXud5Z4xxTWHDqso8kcdqmgw6xqnY+i/AewdVeMJktqXTDFhSf7GaerBHZU1PlUULL
 JJbo79B4mRwxOQb4g8G7KWjsbYyfcqE=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-45BvKp3DO9SOxadYS9L7eA-1; Wed, 02 Jun 2021 03:05:41 -0400
X-MC-Unique: 45BvKp3DO9SOxadYS9L7eA-1
Received: by mail-pj1-f72.google.com with SMTP id
 jx8-20020a17090b46c8b02901640d55b228so958280pjb.0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 02 Jun 2021 00:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=N7AFjn1kAaIwJ7yXpW9H7ltpl4fJk13y2xBWVC0JT2Y=;
 b=NZD5PO//aT/65Z0nHljTP/8zKrctXail1+/Q/YiWzmlpBmOnYMaQoKRZp56r/FZ9sD
 kW/bkAQ2l2d+ctTEP2RqmRQZPHxSoI8lPUZlk3mE66L+K87IgHi0JVGIvVM6KHhiSHiM
 n8S3OQOko6GCc/+ZdLf0nXEWQnQCZ0ZOIKdHKxFFVjnrks2dAxJouDc8PbeBzTl6gC2S
 S/cILhL92CyIUYRyyIzDM6J6nuivn0sq1E2g/fM5A77fnGqAb4Rhxyfmk9IcfhjRp3P/
 0z+rywSUdm+85/cNnY0ZYzZtvR5phQ6VTF2diPFHeOJ/2sFsQlhTqn/VGRIuS1xaK6X2
 B9OA==
X-Gm-Message-State: AOAM5304t+PcVNqFFSWw9eIBGPlJLunryUrUK0Wxhv9kfTIbi5tMYXRb
 8XT76snx08e2RrEP+7s4PXAuy362pQxof1pIQ3gUi0i2D/qDf/3Qil1s18aTUI2mPXpQ58Pn23R
 wR3NLo/RHpP3ZBQHmwpg+Tg1VZXX7b+7ObP9YVY0ZLg==
X-Received: by 2002:a63:d908:: with SMTP id r8mr17698728pgg.414.1622617540707; 
 Wed, 02 Jun 2021 00:05:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxi1fo5eUxqSSq1jhRLtWR5oM/z3BQO8r5DzrHXf+icFTZlIa8TZoB63MRifCqrns7bI6/5cA==
X-Received: by 2002:a63:d908:: with SMTP id r8mr17698704pgg.414.1622617540453; 
 Wed, 02 Jun 2021 00:05:40 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id x19sm15554961pgj.66.2021.06.02.00.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 00:05:40 -0700 (PDT)
Subject: Re: [PATCH V2 3/4] vp_vdpa: allow set vq state to initial state after
 reset
To: Eli Cohen <elic@nvidia.com>
References: <20210602021043.39201-1-jasowang@redhat.com>
 <20210602021043.39201-4-jasowang@redhat.com>
 <20210602061324.GA8662@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <091dc6d0-8754-7b2a-64ec-985ef9db6329@redhat.com>
Date: Wed, 2 Jun 2021 15:05:35 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210602061324.GA8662@mtl-vdi-166.wap.labs.mlnx>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 eli@mellanox.com
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

CtTaIDIwMjEvNi8yIM/CzucyOjEzLCBFbGkgQ29oZW4g0LS1wDoKPiBPbiBXZWQsIEp1biAwMiwg
MjAyMSBhdCAxMDoxMDo0MkFNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+PiBXZSB1c2VkIHRv
IGZhaWwgdGhlIHNldF92cV9zdGF0ZSgpIHNpbmNlIGl0IHdhcyBub3Qgc3VwcG9ydGVkIHlldCBi
eQo+PiB0aGUgdmlydGlvIHNwZWMuIEJ1dCBpZiB0aGUgYnVzIHRyaWVzIHRvIHNldCB0aGUgc3Rh
dGUgd2hpY2ggaXMgZXF1YWwKPj4gdG8gdGhlIGRldmljZSBpbml0aWFsIHN0YXRlIGFmdGVyIHJl
c2V0LCB3ZSBjYW4gbGV0IGl0IGdvLgo+Pgo+PiBUaGlzIGlzIGEgbXVzdCBmb3IgdmlydGlvX3Zk
cGEoKSB0byBzZXQgdnEgc3RhdGUgZHVyaW5nIHByb2JlIHdoaWNoIGlzCj4+IHJlcXVpcmVkIGZv
ciBzb21lIHZEUEEgcGFyZW50cy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy92ZHBhL3ZpcnRpb19wY2kvdnBf
dmRwYS5jIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy92ZHBhL3ZpcnRpb19wY2kvdnBfdmRwYS5jIGIvZHJpdmVycy92ZHBhL3ZpcnRp
b19wY2kvdnBfdmRwYS5jCj4+IGluZGV4IGM3NmViYjUzMTIxMi4uMThiZjRhNDIyNzcyIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL3ZkcGEvdmlydGlvX3BjaS92cF92ZHBhLmMKPj4gKysrIGIvZHJp
dmVycy92ZHBhL3ZpcnRpb19wY2kvdnBfdmRwYS5jCj4+IEBAIC0yMTAsMTMgKzIxMCw0OSBAQCBz
dGF0aWMgaW50IHZwX3ZkcGFfZ2V0X3ZxX3N0YXRlKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSwg
dTE2IHFpZCwKPj4gICAJcmV0dXJuIC1FT1BOT1RTVVBQOwo+PiAgIH0KPj4gICAKPj4gK3N0YXRp
YyBpbnQgdnBfdmRwYV9zZXRfdnFfc3RhdGVfc3BsaXQoc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBh
LAo+PiArCQkJCSAgICAgIGNvbnN0IHN0cnVjdCB2ZHBhX3ZxX3N0YXRlICpzdGF0ZSkKPj4gK3sK
Pj4gKwljb25zdCBzdHJ1Y3QgdmRwYV92cV9zdGF0ZV9zcGxpdCAqc3BsaXQgPSAmc3RhdGUtPnNw
bGl0Owo+PiArCj4+ICsJaWYgKHNwbGl0LT5hdmFpbF9pbmRleCA9PSAwKQo+PiArCQlyZXR1cm4g
MDsKPj4gKwo+PiArCXJldHVybiAtRU9QTk9UU1VQUDsKPj4gK30KPj4gKwo+PiArc3RhdGljIGlu
dCB2cF92ZHBhX3NldF92cV9zdGF0ZV9wYWNrZWQoc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhLAo+
PiArCQkJCSAgICAgICBjb25zdCBzdHJ1Y3QgdmRwYV92cV9zdGF0ZSAqc3RhdGUpCj4+ICt7Cj4+
ICsJY29uc3Qgc3RydWN0IHZkcGFfdnFfc3RhdGVfcGFja2VkICpwYWNrZWQgPSAmc3RhdGUtPnBh
Y2tlZDsKPj4gKwo+PiArCWlmIChwYWNrZWQtPmxhc3RfYXZhaWxfY291bnRlciA9PSAxICYmCj4g
Q2FuIHlvdSBlbGFib3JhdGUgb24gdGhlIHJlcXVpcmVtZW50IG9uIGxhc3RfYXZhaWxfY291bnRl
ciBhbmQKPiBsYXN0X3VzZWRfY291bnRlcj8KCgpUaGlzIGlzIHJlcXVpcmVkIGJ5IHRoZSB2aXJ0
aW8gc3BlYzoKCiIKMi43LjEgRHJpdmVyIGFuZCBEZXZpY2UgUmluZyBXcmFwIENvdW50ZXJzCkVh
Y2ggb2YgdGhlIGRyaXZlciBhbmQgdGhlIGRldmljZSBhcmUgZXhwZWN0ZWQgdG8gbWFpbnRhaW4s
IGludGVybmFsbHksIAphIHNpbmdsZS1iaXQgcmluZyB3cmFwIGNvdW50ZXIgaW5pdGlhbGl6ZWQg
dG8gMS4KIgoKRm9yIHZpcnRpby1wY2kgZGV2aWNlLCBzaW5jZSB0aGVyZSdzIG5vIHdheSB0byBh
c3NpZ24gdGhlIHZhbHVlIG9mIHRob3NlIApjb3VudGVycywgdGhlIGNvdW50ZXJzIHdpbGwgYmUg
cmVzZXQgdG8gMSBhZnRlciByZXNldCwgb3RoZXJ3aXNlIHRoZSAKZHJpdmVyIGNhbid0IHdvcmsu
CgpUaGFua3MKCgo+Cj4+ICsJICAgIHBhY2tlZC0+bGFzdF9hdmFpbF9pZHggPT0gMCAmJgo+PiAr
CSAgICBwYWNrZWQtPmxhc3RfdXNlZF9jb3VudGVyID09IDEgJiYKPj4gKwkgICAgcGFja2VkLT5s
YXN0X3VzZWRfaWR4ID09IDApCj4+ICsJCXJldHVybiAwOwo+PiArCj4+ICsJcmV0dXJuIC1FT1BO
T1RTVVBQOwo+PiArfQo+PiArCj4+ICAgc3RhdGljIGludCB2cF92ZHBhX3NldF92cV9zdGF0ZShz
dHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEsIHUxNiBxaWQsCj4+ICAgCQkJCWNvbnN0IHN0cnVjdCB2
ZHBhX3ZxX3N0YXRlICpzdGF0ZSkKPj4gICB7Cj4+IC0JLyogTm90ZSB0aGF0IHRoaXMgaXMgbm90
IHN1cHBvcnRlZCBieSB2aXJ0aW8gc3BlY2lmaWNhdGlvbiwgc28KPj4gLQkgKiB3ZSByZXR1cm4g
LUVOT1BPVFNVUFAgaGVyZS4gVGhpcyBtZWFucyB3ZSBjYW4ndCBzdXBwb3J0IGxpdmUKPj4gLQkg
KiBtaWdyYXRpb24sIHZob3N0IGRldmljZSBzdGFydC9zdG9wLgo+PiArCXN0cnVjdCB2aXJ0aW9f
cGNpX21vZGVybl9kZXZpY2UgKm1kZXYgPSB2ZHBhX3RvX21kZXYodmRwYSk7Cj4+ICsKPj4gKwkv
KiBOb3RlIHRoYXQgdGhpcyBpcyBub3Qgc3VwcG9ydGVkIGJ5IHZpcnRpbyBzcGVjaWZpY2F0aW9u
Lgo+PiArCSAqIEJ1dCBpZiB0aGUgc3RhdGUgaXMgYnkgY2hhbmNlIGVxdWFsIHRvIHRoZSBkZXZp
Y2UgaW5pdGlhbAo+PiArCSAqIHN0YXRlLCB3ZSBjYW4gbGV0IGl0IGdvLgo+PiAgIAkgKi8KPj4g
KwlpZiAoKHZwX21vZGVybl9nZXRfc3RhdHVzKG1kZXYpICYgVklSVElPX0NPTkZJR19TX0ZFQVRV
UkVTX09LKSAmJgo+PiArCSAgICAhdnBfbW9kZXJuX2dldF9xdWV1ZV9lbmFibGUobWRldiwgcWlk
KSkgewo+PiArCQlpZiAodnBfbW9kZXJuX2dldF9kcml2ZXJfZmVhdHVyZXMobWRldikgJgo+PiAr
CQkgICAgQklUX1VMTChWSVJUSU9fRl9SSU5HX1BBQ0tFRCkpCj4+ICsJCQlyZXR1cm4gdnBfdmRw
YV9zZXRfdnFfc3RhdGVfcGFja2VkKHZkcGEsIHN0YXRlKTsKPj4gKwkJZWxzZQo+PiArCQkJcmV0
dXJuIHZwX3ZkcGFfc2V0X3ZxX3N0YXRlX3NwbGl0KHZkcGEsCXN0YXRlKTsKPj4gKwl9Cj4+ICsK
Pj4gICAJcmV0dXJuIC1FT1BOT1RTVVBQOwo+PiAgIH0KPj4gICAKPj4gLS0gCj4+IDIuMjUuMQo+
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
