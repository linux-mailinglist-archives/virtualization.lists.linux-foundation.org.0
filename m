Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BD71F6443
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 11:06:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1E24C879F4;
	Thu, 11 Jun 2020 09:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lPju8J4zpJDt; Thu, 11 Jun 2020 09:06:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 60170879E9;
	Thu, 11 Jun 2020 09:06:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D587C016F;
	Thu, 11 Jun 2020 09:06:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C9C2C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 09:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 732EB886C1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 09:06:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oD-cOmH8ekTH
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 09:06:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 504FD886BD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 09:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591866405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EMC0E2B827Ia2DQRzxKsWY/OK5Bg//cvAlofONDhk2Q=;
 b=CDXgEr+EKvV5ntUXOSA2QcNFsr/CHHfGNpy2UioYOT4kYXXA7Fb/YRwlB5NtGGRbZ0am2X
 rOItVzsG2E2ekTGJylt8N+J/4iO6U+HiMOlaZIZ0V7qHKKh4+CR0QpS+WyiZXv14CQu8Gt
 jlyIYphj03AwPrCiwGVkeCPUuGWjYjI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-kOnMVWydMg64bBV2SoKhWg-1; Thu, 11 Jun 2020 05:06:43 -0400
X-MC-Unique: kOnMVWydMg64bBV2SoKhWg-1
Received: by mail-wm1-f70.google.com with SMTP id y15so884997wmi.0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 02:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EMC0E2B827Ia2DQRzxKsWY/OK5Bg//cvAlofONDhk2Q=;
 b=cCuAjnsLct4Y9QnfG/4UN12++6QFvNeocqVRrLOw6fo95iVLyyWmIs7Y8ubPTBU7xG
 IU0SJoiiqUlF/bryXKzYewV4Eei9q+phTYsF+6paDxy1ayn2IBahiXygmq4YaCMbf6RF
 rTGv16Q4X/hIeNsUURWk9EqQ9QTDMYbZ224RJxjUWQrK9OiCwKB3Tstrb6T1daV7JtuN
 q8maJtarcRRzOBfaxrlBA63nLn19PytNXdLiJ2BdCWCDwxLribrIC+xtsts0A1qVxtNi
 g0KXqxg8oAH5G9st3BJfePyZkt2LwoOGwE2Uky3+mavorJ+ajY0SYk7BMAbSKBPhPpHc
 iltw==
X-Gm-Message-State: AOAM530GV8AHjO++Cq0VdQrOopRT8EnG7cj5DQvwjlFmpXb9NMQvVfbo
 pev3n5pOjYbQ2dRS1PEeWbIK02zilU2whPhdpY4PrIwwylNkLfSJiOyWw3Jn98b2YH4a+ZxuqUY
 dB3QbVapLhFiXq3+EsaNrkWliVcMwr87DlE/VxX05ZQ==
X-Received: by 2002:adf:dccc:: with SMTP id x12mr8242095wrm.72.1591866401977; 
 Thu, 11 Jun 2020 02:06:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjS282NzyfgjaTUCOeu+TiuTHkZ19eiBXmK6U3BwQgdXs1XxcOHzbjcay7nTvobbz5n62KJQ==
X-Received: by 2002:adf:dccc:: with SMTP id x12mr8242068wrm.72.1591866401733; 
 Thu, 11 Jun 2020 02:06:41 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id y80sm3152548wmc.34.2020.06.11.02.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 02:06:40 -0700 (PDT)
Date: Thu, 11 Jun 2020 05:06:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RFC v6 02/11] vhost: use batched get_vq_desc version
Message-ID: <20200611050416-mutt-send-email-mst@kernel.org>
References: <20200608125238.728563-1-mst@redhat.com>
 <20200608125238.728563-3-mst@redhat.com>
 <81904cc5-b662-028d-3b4a-bdfdbd2deb8c@redhat.com>
 <20200610070259-mutt-send-email-mst@kernel.org>
 <76b14132-407a-48bf-c4d5-9d0b2c700bb0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <76b14132-407a-48bf-c4d5-9d0b2c700bb0@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, eperezma@redhat.com, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

T24gVGh1LCBKdW4gMTEsIDIwMjAgYXQgMTE6MDI6NTdBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzYvMTAg5LiL5Y2INzowNSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gPiA+ICtFWFBPUlRfU1lNQk9MX0dQTCh2aG9zdF9nZXRfdnFfZGVzYyk7Cj4gPiA+ID4g
ICAgLyogUmV2ZXJzZSB0aGUgZWZmZWN0IG9mIHZob3N0X2dldF92cV9kZXNjLiBVc2VmdWwgZm9y
IGVycm9yIGhhbmRsaW5nLiAqLwo+ID4gPiA+ICAgIHZvaWQgdmhvc3RfZGlzY2FyZF92cV9kZXNj
KHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxLCBpbnQgbikKPiA+ID4gPiAgICB7Cj4gPiA+ID4g
Kwl1bmZldGNoX2Rlc2NzKHZxKTsKPiA+ID4gPiAgICAJdnEtPmxhc3RfYXZhaWxfaWR4IC09IG47
Cj4gPiA+IFNvIHVuZmV0Y2hfZGVzY3MoKSBoYXMgZGVjcmVhc2VkIGxhc3RfYXZhaWxfaWR4Lgo+
ID4gPiBDYW4gd2UgZml4IHRoaXMgYnkgbGV0dGluZyB1bmZldGNoX2Rlc2NzKCkgcmV0dXJuIHRo
ZSBudW1iZXIgYW5kIHRoZW4gd2UgY2FuCj4gPiA+IGRvOgo+ID4gPiAKPiA+ID4gaW50IGQgPSB1
bmZldGNoX2Rlc2NzKHZxKTsKPiA+ID4gdnEtPmxhc3RfYXZhaWxfaWR4IC09IChuID4gZCkgPyBu
IC0gZDogMDsKPiA+ID4gCj4gPiA+IFRoYW5rcwo+ID4gVGhhdCdzIGludGVudGlvbmFsIEkgdGhp
bmsgLSB3ZSBuZWVkIGJvdGguCj4gCj4gCj4gWWVzLCBidXQ6Cj4gCj4gCj4gPiAKPiA+IFVuZmV0
Y2hfZGVzY3MgZHJvcHMgdGhlIGRlc2NyaXB0b3JzIGluIHRoZSBjYWNoZSB0aGF0IHdlcmUKPiA+
ICpub3QgcmV0dXJuZWQgdG8gY2FsbGVyKiAgdGhyb3VnaCBnZXRfdnFfZGVzYy4KPiA+IAo+ID4g
dmhvc3RfZGlzY2FyZF92cV9kZXNjIGRyb3BzIHRoZSBvbmVzIHRoYXQgd2VyZSByZXR1cm5lZCB0
aHJvdWdoIGdldF92cV9kZXNjLgo+ID4gCj4gPiBEaWQgSSBtaXNzIGFueXRoaW5nPwo+IAo+IFdl
IGNvdWxkIGNvdW50IHNvbWUgZGVzY3JpcHRvcnMgdHdpY2UsIGNvbnNpZGVyIHRoZSBjYXNlIGUu
ZyB3ZSBvbmx5IGNhY2hlCj4gb24gZGVzY3JpcHRvcjoKPiAKPiBmZXRjaF9kZXNjcygpCj4gwqDC
oMKgIGZldGNoX2J1ZigpCj4gwqDCoMKgIMKgwqDCoCBsYXN0X2F2YWlsX2lkeCsrOwo+IAo+IFRo
ZW4gd2Ugd2FudCBkbyBkaXNjYXJkIGl0Ogo+IHZob3N0X2Rpc2NhcmRfYXZhaWxfYnVmKDEpCj4g
wqDCoMKgIHVuZmV0Y2hfZGVzY3MoKQo+IMKgwqDCoCDCoMKgwqAgbGFzdF9hdmFpbF9pZHgtLTsK
PiDCoMKgwqAgbGFzdF9hdmFpbF9pZHggLT0gMTsKPiAKPiBUaGFua3MKCgpJIGRvbid0IHRoaW5r
IHRoYXQgaGFwcGVucy4gdmhvc3RfZGlzY2FyZF9hdmFpbF9idWYoMSkgaXMgb25seSBjYWxsZWQK
YWZ0ZXIgZ2V0IHZob3N0X2dldF9hdmFpbF9idWYuIHZob3N0X2dldF9hdmFpbF9idWYgaW5jcmVt
ZW50cwpmaXJzdF9kZXNjLiAgdW5mZXRjaF9kZXNjcyBvbmx5IGNvdW50cyBmcm9tIGZpcnN0X2Rl
c2MgdG8gbmRlc2NzLgoKSWYgSSdtIHdyb25nLCBjb3VsZCB5b3Ugc2hvdyB2YWx1ZXMgb2YgZmly
c3RfZGVzYyBhbmQgbmRlc2NzIGluIHRoaXMKc2NlbmFyaW8/CgotLSAKTVNUCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
