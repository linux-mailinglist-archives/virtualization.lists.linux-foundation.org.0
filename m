Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5790B3DFCD4
	for <lists.virtualization@lfdr.de>; Wed,  4 Aug 2021 10:28:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98694405B4;
	Wed,  4 Aug 2021 08:28:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W7w1Ft24UZnB; Wed,  4 Aug 2021 08:28:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 812804058D;
	Wed,  4 Aug 2021 08:28:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C811C000E;
	Wed,  4 Aug 2021 08:28:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12019C001F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 08:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D19F3605D6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 08:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xgz64zSMJ3km
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 08:27:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5E096066A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 08:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628065677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VzZ2fz11QFkhGxgNVXLaPyQv4vbgyLKy/JcMqXEwSCE=;
 b=G6m8oA3op9pu+76PZVZ8PHY/jWhpglbO+cAwI3S0z/PqxPFwTv9Yh8r2LfVlqWOgDH06C9
 lNbB9mQpPk0xLukYBxK6dOhlmCf/o+NX4XoHUl/j5GuS5ot+RyDfjnu6KNO3NzUz1XsQ1k
 KzJZDVxJTgj6V6k2lDzDLfMVBWj6Lj8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-Xo1xhBdBNqOIHFke4Bx3rQ-1; Wed, 04 Aug 2021 04:27:56 -0400
X-MC-Unique: Xo1xhBdBNqOIHFke4Bx3rQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 k1-20020a17090a39c1b0290176898bbb9cso1825165pjf.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 04 Aug 2021 01:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=VzZ2fz11QFkhGxgNVXLaPyQv4vbgyLKy/JcMqXEwSCE=;
 b=Y6ukJ82Eh5VE14ZFoXLquv0YoXDbFW9JPqWpewVFgV3eTSRiIrY7jHWOGkaV+/3+AI
 gm9ZQEgrp4TOG6OP6kxCbnl/T9iFv8p+YkR5mT55FAKCPGAoBIpvSL4oM4BvXfnddwiq
 kh9NCfFpkNBsThAFWDxXmcqg2vsyzSeRdwImsvk3o4BBUTbNQKKTj7JLaYFQ3zqxp8/+
 rG9i2LVqsR4e6//KerQYqGSQ/2jFq+soMDeNlRv/NEVNmqq6Sp0hpqSn7H0mTFKw4LDM
 KmPctuptBUnbt5ec04e8RG6M2BGELV8VYiRT06FHbxdGTJksWombTvdGY4zM2yD7Ov85
 Vxzw==
X-Gm-Message-State: AOAM5336ZYy1YjfDUH9CSts7MENet3rPdr2TuNQhqYEk10qtVch2LzwQ
 5jj+e0pjCMWIW4IEk23OdgPuNTyTfGhOKCcDknUJSXuhwu/gqBBfWdidEYXPT5KUpzh781bbA7U
 Z1mF6f8WiOenKx+ZbdJomiKrZjN2HffAhQRLVq035kw==
X-Received: by 2002:a65:620a:: with SMTP id d10mr1146355pgv.120.1628065675419; 
 Wed, 04 Aug 2021 01:27:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXILAtwY28td6fRSflYoyigX2PjP4ZVbOPHaGCmnbiB1lEKAblvPX4KIAKHqSTrKqVGtkG2Q==
X-Received: by 2002:a65:620a:: with SMTP id d10mr1146334pgv.120.1628065675198; 
 Wed, 04 Aug 2021 01:27:55 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id l2sm1714190pfc.157.2021.08.04.01.27.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 01:27:54 -0700 (PDT)
Subject: Re: [PATCH v10 02/17] file: Export receive_fd() to modules
To: Yongji Xie <xieyongji@bytedance.com>
References: <20210729073503.187-1-xieyongji@bytedance.com>
 <20210729073503.187-3-xieyongji@bytedance.com>
 <a0ab081a-db06-6b7a-b22e-4ace96a5c7db@redhat.com>
 <CACycT3sdx8nA8fh3pjO_=pbiM+Bs5y+h4fuGkFQEsRSaBnph7Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0a37dce4-0012-c2d1-bb06-5e9409815b93@redhat.com>
Date: Wed, 4 Aug 2021 16:27:42 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CACycT3sdx8nA8fh3pjO_=pbiM+Bs5y+h4fuGkFQEsRSaBnph7Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: kvm <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Christian Brauner <christian.brauner@canonical.com>,
 Jonathan Corbet <corbet@lwn.net>, joro@8bytes.org,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Liu Xiaodong <xiaodong.liu@intel.com>, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Stefan Hajnoczi <stefanha@redhat.com>,
 songmuchun@bytedance.com, Jens Axboe <axboe@kernel.dk>,
 He Zhe <zhe.he@windriver.com>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 bcrl@kvack.org, netdev@vger.kernel.org, Joe Perches <joe@perches.com>,
 =?UTF-8?Q?Mika_Penttil=c3=a4?= <mika.penttila@nextfour.com>
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

CuWcqCAyMDIxLzgvMyDkuIvljYg1OjAxLCBZb25namkgWGllIOWGmemBkzoKPiBPbiBUdWUsIEF1
ZyAzLCAyMDIxIGF0IDM6NDYgUE0gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3Jv
dGU6Cj4+Cj4+IOWcqCAyMDIxLzcvMjkg5LiL5Y2IMzozNCwgWGllIFlvbmdqaSDlhpnpgZM6Cj4+
PiBFeHBvcnQgcmVjZWl2ZV9mZCgpIHNvIHRoYXQgc29tZSBtb2R1bGVzIGNhbiB1c2UKPj4+IGl0
IHRvIHBhc3MgZmlsZSBkZXNjcmlwdG9yIGJldHdlZW4gcHJvY2Vzc2VzIHdpdGhvdXQKPj4+IG1p
c3NpbmcgYW55IHNlY3VyaXR5IHN0dWZmcy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBYaWUgWW9u
Z2ppIDx4aWV5b25namlAYnl0ZWRhbmNlLmNvbT4KPj4+IC0tLQo+Pj4gICAgZnMvZmlsZS5jICAg
ICAgICAgICAgfCA2ICsrKysrKwo+Pj4gICAgaW5jbHVkZS9saW51eC9maWxlLmggfCA3ICsrKy0t
LS0KPj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9maWxlLmMgYi9mcy9maWxlLmMKPj4+IGluZGV4IDg2
ZGM5OTU2YWYzMi4uMjEwZTU0MDY3MmFhIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZmlsZS5jCj4+PiAr
KysgYi9mcy9maWxlLmMKPj4+IEBAIC0xMTM0LDYgKzExMzQsMTIgQEAgaW50IHJlY2VpdmVfZmRf
cmVwbGFjZShpbnQgbmV3X2ZkLCBzdHJ1Y3QgZmlsZSAqZmlsZSwgdW5zaWduZWQgaW50IG9fZmxh
Z3MpCj4+PiAgICAgICAgcmV0dXJuIG5ld19mZDsKPj4+ICAgIH0KPj4+Cj4+PiAraW50IHJlY2Vp
dmVfZmQoc3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGludCBvX2ZsYWdzKQo+Pj4gK3sKPj4+
ICsgICAgIHJldHVybiBfX3JlY2VpdmVfZmQoZmlsZSwgTlVMTCwgb19mbGFncyk7Cj4+Cj4+IEFu
eSByZWFzb24gdGhhdCByZWNlaXZlX2ZkX3VzZXIoKSBjYW4gbGl2ZSBpbiB0aGUgZmlsZS5oPwo+
Pgo+IFNpbmNlIG5vIG1vZHVsZXMgdXNlIGl0Lgo+Cj4gVGhhbmtzLAo+IFlvbmdqaQoKCk9rLgoK
CkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
