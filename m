Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F1C19AE20
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 16:40:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 66B4C2034C;
	Wed,  1 Apr 2020 14:40:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 597+7EXQqld2; Wed,  1 Apr 2020 14:40:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CA98620486;
	Wed,  1 Apr 2020 14:40:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFA77C089F;
	Wed,  1 Apr 2020 14:40:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 700DFC089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6B86920447
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:39:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LnJOrHZ-oFLp
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:39:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 95BA32034C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585751997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3dF1PbHxH2PUjMb+4bV/GaRouljVSwT6GLw7f2p2RYE=;
 b=a+aLqsr/I9qHDHqMIPi7scK5MVwbPEEdIBla0d6m7ayy6yBUHF/kQJFrZAvlnwVWvmBeIc
 9qZTq2VR14TXBaMsgVsUFLCywExGEQnflQz8oDe5YNrbb8CJ0vC/FWR/Dl6z9K70fpFiZs
 oh/2nJgYFgigzbL++jOe4F/W5qpezrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-C322hxx7Nt6lcsGRbTY05w-1; Wed, 01 Apr 2020 10:39:55 -0400
X-MC-Unique: C322hxx7Nt6lcsGRbTY05w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5DCD8017FB;
 Wed,  1 Apr 2020 14:39:52 +0000 (UTC)
Received: from [10.72.12.139] (ovpn-12-139.pek2.redhat.com [10.72.12.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A66DE19C69;
 Wed,  1 Apr 2020 14:39:35 +0000 (UTC)
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-2-jasowang@redhat.com>
 <20200401092004-mutt-send-email-mst@kernel.org>
 <6b4d169a-9962-6014-5423-1507059343e9@redhat.com>
 <20200401100954-mutt-send-email-mst@kernel.org>
 <3dd3b7e7-e3d9-dba4-00fc-868081f95ab7@redhat.com>
 <20200401103311-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <51e43cc8-63fe-94c1-54f6-1200e5ef772d@redhat.com>
Date: Wed, 1 Apr 2020 22:39:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200401103311-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: kvm@vger.kernel.org, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, jgg@mellanox.com, shahafs@mellanox.com,
 parav@mellanox.com, vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 zhangweining@ruijie.com.cn, netdev@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
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

Ck9uIDIwMjAvNC8xIOS4i+WNiDEwOjM1LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L0tjb25maWcgYi9kcml2ZXJzL3Zob3N0L0tjb25maWcK
Pj4gaW5kZXggMjUyM2ExZDQyOTBhLi4zNjJiODMyZjUzMzggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZl
cnMvdmhvc3QvS2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL3Zob3N0L0tjb25maWcKPj4gQEAgLTEx
LDE5ICsxMSwyMyBAQCBjb25maWcgVkhPU1RfUklORwo+PiAgIAkgIFRoaXMgb3B0aW9uIGlzIHNl
bGVjdGVkIGJ5IGFueSBkcml2ZXIgd2hpY2ggbmVlZHMgdG8gYWNjZXNzCj4+ICAgCSAgdGhlIGhv
c3Qgc2lkZSBvZiBhIHZpcnRpbyByaW5nLgo+PiAgIAo+PiAtbWVudWNvbmZpZyBWSE9TVAo+PiAt
CXRyaXN0YXRlICJIb3N0IGtlcm5lbCBhY2NlbGVyYXRvciBmb3IgdmlydGlvIChWSE9TVCkiCj4+
IC0JZGVwZW5kcyBvbiBFVkVOVEZECj4+ICtjb25maWcgVkhPU1QKPj4gKwl0cmlzdGF0ZQo+PiAg
IAlzZWxlY3QgVkhPU1RfSU9UTEIKPj4gICAJaGVscAo+PiAgIAkgIFRoaXMgb3B0aW9uIGlzIHNl
bGVjdGVkIGJ5IGFueSBkcml2ZXIgd2hpY2ggbmVlZHMgdG8gYWNjZXNzCj4+ICAgCSAgdGhlIGNv
cmUgb2Ygdmhvc3QuCj4+ICAgCj4+IC1pZiBWSE9TVAo+PiArbWVudWNvbmZpZyBWSE9TVF9NRU5V
Cj4+ICsJYm9vbCAiVkhPU1QgZHJpdmVycyIKPj4gKwlkZWZhdWx0IHkKPj4gKwo+PiAraWYgVkhP
U1RfTUVOVQo+IFdpbGwgdGhpcyBub3Qgc3RpbGwgaGF2ZSB0aGUgcHJvYmxlbSB3aXRoIGRlZmNv
bmZpZ3M/IFRoZXkgZG9uJ3Qgc2V0Cj4gVkhPU1RfTUVOVSAuLi4KCgpMb29rcyBub3QsIHNpbmNl
IGl0IHdhcyBlbmFibGVkIGJ5IGRlZmF1bHQuCgpJIHRlc3RlZCB0aGlzIG9uIHMzOTAvcHBjIGRl
ZmNvbmZpZ3M6CgojIG1ha2UgQVJDSD1zMzkwIGRlZmNvbmZpZwoqKiogRGVmYXVsdCBjb25maWd1
cmF0aW9uIGlzIGJhc2VkIG9uICdkZWZjb25maWcnCiMKIyBObyBjaGFuZ2UgdG8gLmNvbmZpZwoj
CiMgZ3JlcCBDT05GSUdfVkhPU1QgLmNvbmZpZwpDT05GSUdfVkhPU1RfSU9UTEI9bQpDT05GSUdf
VkhPU1Q9bQpDT05GSUdfVkhPU1RfTUVOVT15CkNPTkZJR19WSE9TVF9ORVQ9bQpDT05GSUdfVkhP
U1RfVlNPQ0s9bQojIENPTkZJR19WSE9TVF9WRFBBIGlzIG5vdCBzZXQKIyBDT05GSUdfVkhPU1Rf
Q1JPU1NfRU5ESUFOX0xFR0FDWSBpcyBub3Qgc2V0CgpUaGFua3MKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
