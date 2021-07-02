Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC3A3B9AC0
	for <lists.virtualization@lfdr.de>; Fri,  2 Jul 2021 04:49:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 072FD41642;
	Fri,  2 Jul 2021 02:49:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YAmyHxBp-v1F; Fri,  2 Jul 2021 02:49:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BE7C1405C7;
	Fri,  2 Jul 2021 02:49:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E375C000E;
	Fri,  2 Jul 2021 02:49:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E4FAC000E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 02:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12174405C7
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 02:49:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uf_38P4I59yZ
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 02:49:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDB3240599
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 02:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625194164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m5z3d4RwQ1oxkBNEm0vInMTPKMfejVnKxB2uO9Gpumg=;
 b=S+zTxp0zKJ/WzOaookKyQP0o/qgJmbJhOln6W2Z5VV013xssZaXlXbNgzW8MRAYI/N/RYF
 HHkMM0rrqlcI2bvv+UQeuP0E0x30UE5INuAVKH2HSmS6J/8S/90Jot5EoiqxL5xwhnPF3Q
 2lU2YOCHfj+YGbBUuYAuH/ZGjmnTAMk=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-KS1aOZSHNH6aUZ8E7ZtBxA-1; Thu, 01 Jul 2021 22:49:23 -0400
X-MC-Unique: KS1aOZSHNH6aUZ8E7ZtBxA-1
Received: by mail-pj1-f70.google.com with SMTP id
 om5-20020a17090b3a85b029016eb0b21f1dso4355228pjb.4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 01 Jul 2021 19:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=m5z3d4RwQ1oxkBNEm0vInMTPKMfejVnKxB2uO9Gpumg=;
 b=bwu+ofFWfV2U7+m1OGyDLV92RjXt+cIsZgbVHQKD2AYkYnNjgDEYWZt1YMVzm+DyE6
 p5xT03nQPUrdRBFxfhLblDHpn57AyfE7BSZaDHgXHimalaNNFrI4ODmLH2FjelVuStKc
 F4uyXkUdvmeHzkSzDaXQU+CtXsEabLzAgrf8LqVMuSO27VzEYYgdO7Mr555CzhyP0QGp
 AnNNoULdTyDeATNQf40nEzb551/nrrA+tzcbaEdA/9vEwPkQ3U/qg5L0bKXKMmQo+na5
 v/6buQqe4THicyXK2KKMgi0DB5Lmyc/J/4wejPJ1P9NTf5FbRDnu0Hkk+025aW8lrMvR
 t0aA==
X-Gm-Message-State: AOAM532mG8quskZqOA1z8HTaAn1yzwq//mH5J1cibOmEqh9CFavOxx0p
 6y33EuZ+ym6ZSRY9uzMpQUFB9S+gHSY6nog5zrLxyhQDwOsmhwInpswPJnouCi8lr0ss7f/P49b
 81NhBzFzi7gp6Z82xB33Ojv6wfTpd8DLq/o5wPcbVBA==
X-Received: by 2002:a17:902:cec8:b029:129:3394:b8ab with SMTP id
 d8-20020a170902cec8b02901293394b8abmr2393512plg.42.1625194162442; 
 Thu, 01 Jul 2021 19:49:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziiXCaB2hANUotxmVfz4U3eOo1f66xxuMUB/caj7bntZbEAFOOUgOd2Od56ZkHdILH50CNcw==
X-Received: by 2002:a17:902:cec8:b029:129:3394:b8ab with SMTP id
 d8-20020a170902cec8b02901293394b8abmr2393496plg.42.1625194162264; 
 Thu, 01 Jul 2021 19:49:22 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id w14sm1452484pgo.75.2021.07.01.19.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 19:49:21 -0700 (PDT)
Subject: Re: [PATCH] virtio_vdpa: reject invalid vq indices
To: Vincent Whitchurch <vincent.whitchurch@axis.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20210701114652.21956-1-vincent.whitchurch@axis.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8e6a6793-39a3-0478-c574-5d3d641f2310@redhat.com>
Date: Fri, 2 Jul 2021 10:49:18 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701114652.21956-1-vincent.whitchurch@axis.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: kernel@axis.com, linux-kernel@vger.kernel.org,
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

CtTaIDIwMjEvNy8xIM/Czuc3OjQ2LCBWaW5jZW50IFdoaXRjaHVyY2gg0LS1wDoKPiBEbyBub3Qg
Y2FsbCB2RFBBIGRyaXZlcnMnIGNhbGxiYWNrcyB3aXRoIHZxIGluZGljaWVzIGxhcmdlciB0aGFu
IHdoYXQKPiB0aGUgZHJpdmVycyBpbmRpY2F0ZSB0aGF0IHRoZXkgc3VwcG9ydC4gIHZEUEEgZHJp
dmVycyBkbyBub3QgYm91bmRzCj4gY2hlY2sgdGhlIGluZGljZXMuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBWaW5jZW50IFdoaXRjaHVyY2ggPHZpbmNlbnQud2hpdGNodXJjaEBheGlzLmNvbT4KCgpBY2tl
ZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KCgo+IC0tLQo+ICAgZHJpdmVy
cy92aXJ0aW8vdmlydGlvX3ZkcGEuYyB8IDMgKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3ZkcGEuYyBi
L2RyaXZlcnMvdmlydGlvL3ZpcnRpb192ZHBhLmMKPiBpbmRleCBlMjhhY2Y0ODJlMGMuLmU5Yjlk
ZDAzZjQ0YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fdmRwYS5jCj4gKysr
IGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3ZkcGEuYwo+IEBAIC0xNDksNiArMTQ5LDkgQEAgdmly
dGlvX3ZkcGFfc2V0dXBfdnEoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYsIHVuc2lnbmVkIGlu
dCBpbmRleCwKPiAgIAlpZiAoIW5hbWUpCj4gICAJCXJldHVybiBOVUxMOwo+ICAgCj4gKwlpZiAo
aW5kZXggPj0gdmRwYS0+bnZxcykKPiArCQlyZXR1cm4gRVJSX1BUUigtRU5PRU5UKTsKPiArCj4g
ICAJLyogUXVldWUgc2hvdWxkbid0IGFscmVhZHkgYmUgc2V0IHVwLiAqLwo+ICAgCWlmIChvcHMt
PmdldF92cV9yZWFkeSh2ZHBhLCBpbmRleCkpCj4gICAJCXJldHVybiBFUlJfUFRSKC1FTk9FTlQp
OwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
