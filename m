Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CAF3CCCA9
	for <lists.virtualization@lfdr.de>; Mon, 19 Jul 2021 05:30:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02D3783661;
	Mon, 19 Jul 2021 03:30:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W8lD4LZo4CJV; Mon, 19 Jul 2021 03:30:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D8E7083658;
	Mon, 19 Jul 2021 03:30:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6169FC000E;
	Mon, 19 Jul 2021 03:30:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24608C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 03:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21C8883661
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 03:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tp-EJMxA3Utf
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 03:30:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 139D183658
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 03:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626665451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4thYMEzNgF3AoCRQde59dht0ziPpusYLCABZjd2uI4s=;
 b=OgDC5wZQUf56xcRlQs05aR8IDhy8QeXIyCUKqyuaozDl+VP4aH/gQnpa2mIt9Lqb7jsipQ
 YQ/gr/C/uEotdkkT2p4ocT0FwQr75MWFIBE2oy9Y0GnVm3hFdWvvkPNdqkVCWGvGbg+hMI
 DO20cKqkJYg11XUh1VgBHcOLkLSXQbY=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-iLKolYpxMXmBzXDrOPI7Ww-1; Sun, 18 Jul 2021 23:30:49 -0400
X-MC-Unique: iLKolYpxMXmBzXDrOPI7Ww-1
Received: by mail-pg1-f199.google.com with SMTP id
 e62-20020a6369410000b02902317a67391fso278063pgc.9
 for <virtualization@lists.linux-foundation.org>;
 Sun, 18 Jul 2021 20:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4thYMEzNgF3AoCRQde59dht0ziPpusYLCABZjd2uI4s=;
 b=Z3E5fmAwp9Ag6sHYaaUpiIRtzAaEQcPvGvQTtT32A3yT0lnFltv6zygQOLh2UBbOzY
 jAWFPL6S49puOsjOZNbvltxx5tCWaXdv9c09R7yGPOjIe9MzaS+tjRJCZ+Dv8dEaMtKi
 3G+b6RCNRikCSxpNw6j8o6n83eX9ErPwvCtGyvuNm76nwcdkwIzx3Ot5eTmqWhko3UIG
 zpDjbvAUDoCNTMcfmBzqur4EynUDmY9exWUn9/pEslSAytuK137eD6oGJANkSLeEuKXG
 fB15qDg7t29QoHbLiWf7+uGVK8IHcNcrQixJjTTKEumUTdiH49EPfd3UMAJtP4Wy59Jj
 PWqw==
X-Gm-Message-State: AOAM531VGKmYPmy77zobG7ejKTjlworp7NwWlMMq5Upq2tkYUXgrKSH7
 /zK6shyk5+jlcxNinTvrx89rV93zSIw0Pz/UYnJZK/Q90/GYHGlaMVF03InDkyEy1814aIRGCSk
 jWBzPIF/1bU13ocgy0Aw5YkctzhNlBjcCEUw2WsaLpg==
X-Received: by 2002:a17:90a:fe07:: with SMTP id
 ck7mr11831844pjb.51.1626665448822; 
 Sun, 18 Jul 2021 20:30:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxe6zlZhtmikh9nPja5DIIRB06qSd9L4IveW6TD/qUNVnYqP4YhQrac1LChSjiJDHogpY4xig==
X-Received: by 2002:a17:90a:fe07:: with SMTP id
 ck7mr11831822pjb.51.1626665448660; 
 Sun, 18 Jul 2021 20:30:48 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id i1sm17606689pfo.37.2021.07.18.20.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jul 2021 20:30:48 -0700 (PDT)
Subject: Re: [PATCH 2/2] vhost: Fix the calculation in vhost_overflow()
To: Xie Yongji <xieyongji@bytedance.com>, mst@redhat.com,
 dan.carpenter@oracle.com
References: <20210716102239.96-1-xieyongji@bytedance.com>
 <20210716102239.96-2-xieyongji@bytedance.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e2d68906-ffa1-4e87-4251-d83ce96a8869@redhat.com>
Date: Mon, 19 Jul 2021 11:30:43 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716102239.96-2-xieyongji@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CuWcqCAyMDIxLzcvMTYg5LiL5Y2INjoyMiwgWGllIFlvbmdqaSDlhpnpgZM6Cj4gVGhpcyBmaXhl
cyB0aGUgaW5jb3JyZWN0IGNhbGN1bGF0aW9uIGZvciBpbnRlZ2VyIG92ZXJmbG93Cj4gd2hlbiB0
aGUgbGFzdCBhZGRyZXNzIG9mIGlvdmEgcmFuZ2UgaXMgMHhmZmZmZmZmZi4KPgo+IEZpeGVzOiBl
YzMzZDAzMWExNGIgKCJ2aG9zdDogZGV0ZWN0IDMyIGJpdCBpbnRlZ2VyIHdyYXAgYXJvdW5k4oCc
KQo+IFJlcG9ydGVkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IFhpZSBZb25namkgPHhpZXlvbmdqaUBieXRlZGFuY2UuY29tPgo+IC0tLQo+ICAg
ZHJpdmVycy92aG9zdC92aG9zdC5jIHwgMyArKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3Zo
b3N0LmMgYi9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPiBpbmRleCBiOWU4NTNlNjA5NGQuLmE5ZmQx
YjMxMWQyZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPiArKysgYi9kcml2
ZXJzL3Zob3N0L3Zob3N0LmMKPiBAQCAtNzM4LDcgKzczOCw4IEBAIHN0YXRpYyBib29sIGxvZ19h
Y2Nlc3Nfb2sodm9pZCBfX3VzZXIgKmxvZ19iYXNlLCB1NjQgYWRkciwgdW5zaWduZWQgbG9uZyBz
eikKPiAgIHN0YXRpYyBib29sIHZob3N0X292ZXJmbG93KHU2NCB1YWRkciwgdTY0IHNpemUpCj4g
ICB7Cj4gICAJLyogTWFrZSBzdXJlIDY0IGJpdCBtYXRoIHdpbGwgbm90IG92ZXJmbG93LiAqLwo+
IC0JcmV0dXJuIHVhZGRyID4gVUxPTkdfTUFYIHx8IHNpemUgPiBVTE9OR19NQVggfHwgdWFkZHIg
PiBVTE9OR19NQVggLSBzaXplOwo+ICsJcmV0dXJuIHVhZGRyID4gVUxPTkdfTUFYIHx8IHNpemUg
PiBVTE9OR19NQVggfHwKPiArCSAgICAgICB1YWRkciAtIDEgPiBVTE9OR19NQVggLSBzaXplOwo+
ICAgfQoKCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKCj4gICAK
PiAgIC8qIENhbGxlciBzaG91bGQgaGF2ZSB2cSBtdXRleCBhbmQgZGV2aWNlIG11dGV4LiAqLwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
