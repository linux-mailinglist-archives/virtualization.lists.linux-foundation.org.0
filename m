Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 365373B6D61
	for <lists.virtualization@lfdr.de>; Tue, 29 Jun 2021 06:13:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC19C60731;
	Tue, 29 Jun 2021 04:13:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rBxQ4hNTmQnw; Tue, 29 Jun 2021 04:13:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D248B607EA;
	Tue, 29 Jun 2021 04:13:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6C6CC000E;
	Tue, 29 Jun 2021 04:13:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1C33C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Jun 2021 04:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD60F400DE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Jun 2021 04:13:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GXckKCnQpEhY
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Jun 2021 04:13:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28ADB40193
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Jun 2021 04:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624939993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7N6S5aXlTsxjRnLUAwuT1GGB2dsJH/gvDpQ3UzIqM0M=;
 b=de10XCib3R7RBtNayfm/Uju9GOggjYSz7IGmZyfGySF/Djyuyel6VwSnQE+c1Pe6yRcWpO
 KxpxcqrwtapRYlsXDG32nc6IBOLW/zZOMbZKocmKVFBJfDbgZWYdyqGbzNw3A72UTc0jzd
 aAt5NJcNMgJ5S1Dx1EfSpoVELUrc48M=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-aZQXCKIjMemJIA2As_cgLw-1; Tue, 29 Jun 2021 00:13:08 -0400
X-MC-Unique: aZQXCKIjMemJIA2As_cgLw-1
Received: by mail-pg1-f198.google.com with SMTP id
 x9-20020a6541490000b0290222fe6234d6so7802519pgp.14
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Jun 2021 21:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7N6S5aXlTsxjRnLUAwuT1GGB2dsJH/gvDpQ3UzIqM0M=;
 b=t9OnsV3/dTlCqHFtrmEn6Akybwu3syUpgxhQtV86c1QvvZ0O55p3XWxvB71NYYzbrM
 vCVJ9E7zXMhfG2BlGNW7GmB7eoq/DLmpBYyITpdcECmnDzvmXiCou1CWUMJ22JyVxrvE
 s5Sg1hKvXV/gu47Q8jV/NQwjXxIKKUwQkZrEvOnhtfLsDhDAf6UUGtAus3CVlvc/QhZY
 7k2Ry5oUfuhiT+Fj2oZD4zZMQv4UDyVlNsbP9gv0AfVISzTaYDJsjB1L9wfserg/Khq4
 sgBN2YH3p/IQpVZc91hdyT2I0bpAO6Mi26GnRmBjo+vF5Nge/QUhryBq7uBrmOmLnPJt
 Rl/w==
X-Gm-Message-State: AOAM531IXeGdsKyUQHgvXQ6gf7B/EYIfn8M6oX4A2CePNn8TS7OYDekd
 nkKsCzHijOt3YQSTibdiPnpZ0gl1Sx4WaLGYXE2mvPUwxt8oIuyfmAzkpCRvZhznzdiTl5YS8wN
 bYj+H/StfXnwHEWmiCxwq82Zar33SCD3RLlpvqQ9F6A==
X-Received: by 2002:a65:478d:: with SMTP id e13mr26587081pgs.37.1624939987924; 
 Mon, 28 Jun 2021 21:13:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTnV+jCJcWth5Gh1PanbNwyDV44mMvsm0eLCzSFKGOg12/3H6rwksZzo35n3QJumwiuRcZHQ==
X-Received: by 2002:a65:478d:: with SMTP id e13mr26587053pgs.37.1624939987713; 
 Mon, 28 Jun 2021 21:13:07 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id k13sm1525904pgh.82.2021.06.28.21.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 21:13:07 -0700 (PDT)
Subject: Re: [PATCH v8 00/10] Introduce VDUSE - vDPA Device in Userspace
To: Yongji Xie <elohimes@gmail.com>, Liu Xiaodong <xiaodong.liu@intel.com>
References: <20210615141331.407-1-xieyongji@bytedance.com>
 <20210628103309.GA205554@storage2.sh.intel.com>
 <CAONzpcbjr2zKOAQrWa46Tv=oR1fYkcKLcqqm_tSgO7RkU20yBA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d5321870-ef29-48e2-fdf6-32d99a5fa3b9@redhat.com>
Date: Tue, 29 Jun 2021 12:12:57 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAONzpcbjr2zKOAQrWa46Tv=oR1fYkcKLcqqm_tSgO7RkU20yBA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, christian.brauner@canonical.com,
 corbet@lwn.net, joro@8bytes.org, willy@infradead.org, hch@infradead.org,
 Xie Yongji <xieyongji@bytedance.com>, dan.carpenter@oracle.com,
 viro@zeniv.linux.org.uk, Stefan Hajnoczi <stefanha@redhat.com>,
 songmuchun@bytedance.com, axboe@kernel.dk, gregkh@linuxfoundation.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, bcrl@kvack.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, mika.penttila@nextfour.com
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

CuWcqCAyMDIxLzYvMjgg5LiL5Y2INjozMiwgWW9uZ2ppIFhpZSDlhpnpgZM6Cj4+IFRoZSBsYXJn
ZSBiYXJyaWVyIGlzIGJvdW5jZS1idWZmZXIgbWFwcGluZzogU1BESyByZXF1aXJlcyBodWdlcGFn
ZXMKPj4gZm9yIE5WTWUgb3ZlciBQQ0llIGFuZCBSRE1BLCBzbyB0YWtlIHNvbWUgcHJlYWxsY29h
dGVkIGh1Z2VwYWdlcyB0bwo+PiBtYXAgYXMgYm91bmNlIGJ1ZmZlciBpcyBuZWNlc3NhcnkuIE9y
IGl0J3MgaGFyZCB0byBhdm9pZCBhbiBleHRyYQo+PiBtZW1jcHkgZnJvbSBib3VuY2UtYnVmZmVy
IHRvIGh1Z2VwYWdlLgo+PiBJZiB5b3UgY2FuIGFkZCBhbiBvcHRpb24gdG8gbWFwIGh1Z2VwYWdl
cyBhcyBib3VuY2UtYnVmZmVyLAo+PiB0aGVuIFNQREsgY291bGQgYWxzbyBiZSBhIHBvdGVudGlh
bCB1c2VyIG9mIHZkdXNlLgo+Pgo+IEkgdGhpbmsgd2UgY2FuIHN1cHBvcnQgcmVnaXN0ZXJpbmcg
dXNlciBzcGFjZSBtZW1vcnkgZm9yIGJvdW5jZS1idWZmZXIKPiB1c2UgbGlrZSBYRFAgZG9lcy4g
QnV0IHRoaXMgbmVlZHMgdG8gcGluIHRoZSBwYWdlcywgc28gSSBkaWRuJ3QKPiBjb25zaWRlciBp
dCBpbiB0aGlzIGluaXRpYWwgdmVyc2lvbi4KPgoKTm90ZSB0aGF0IHVzZXJzcGFjZSBzaG91bGQg
YmUgdW5hd2FyZSBvZiB0aGUgZXhpc3RlbmNlIG9mIHRoZSBib3VuY2UgYnVmZmVyLgoKU28gd2Ug
bmVlZCB0byB0aGluayBjYXJlZnVsbHkgb2YgbW1hcCgpIHZzIHVtZW0gcmVnaXN0ZXJpbmcuCgpU
aGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
