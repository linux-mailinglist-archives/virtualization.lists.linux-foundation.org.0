Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EB323C366
	for <lists.virtualization@lfdr.de>; Wed,  5 Aug 2020 04:20:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5585D876B4;
	Wed,  5 Aug 2020 02:20:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p7gilXaeGvZk; Wed,  5 Aug 2020 02:20:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4F0E1875E2;
	Wed,  5 Aug 2020 02:20:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26037C004C;
	Wed,  5 Aug 2020 02:20:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6655C004C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 02:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BF2CC87E58
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 02:20:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kQAGzUsOYPD9
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 02:20:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4CB2A87E4D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 02:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596594024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7DEBvkJfYvveJIW7r94EMN46Ocq9FH45hJA53lH0CMg=;
 b=Wq/GjArxvnSwNTTQ09l/pYZYdITIud8v7UldM7W99O2VSNb3GRpnV03L2S1tL0sdn29Dn9
 7uJwCfGgZoQBnsUZZ+edlqivnuQ3s/cINDsMqopvqEGqTC1aHBtegaihEWVlwkRdAGbMxP
 TMXF/E0MMkpkcdPAferRiIiwPdDh3D8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-A-C2bDaEN02PvsNUr52Dhw-1; Tue, 04 Aug 2020 22:20:22 -0400
X-MC-Unique: A-C2bDaEN02PvsNUr52Dhw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E78B1800469;
 Wed,  5 Aug 2020 02:20:20 +0000 (UTC)
Received: from [10.72.13.71] (ovpn-13-71.pek2.redhat.com [10.72.13.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5FB96931B;
 Wed,  5 Aug 2020 02:20:09 +0000 (UTC)
Subject: Re: [PATCH V5 1/6] vhost: introduce vhost_vring_call
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, sean.j.christopherson@intel.com,
 wanpengli@tencent.com
References: <20200731065533.4144-1-lingshan.zhu@intel.com>
 <20200731065533.4144-2-lingshan.zhu@intel.com>
 <5e646141-ca8d-77a5-6f41-d30710d91e6d@redhat.com>
 <d51dd4e3-7513-c771-104c-b61f9ee70f30@intel.com>
 <156b8d71-6870-c163-fdfa-35bf4701987d@redhat.com>
 <4605de34-c426-33d4-714b-e03716d0374c@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0bae5f7e-0f75-8fb9-37a9-68235862b5fe@redhat.com>
Date: Wed, 5 Aug 2020 10:20:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4605de34-c426-33d4-714b-e03716d0374c@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: shahafs@mellanox.com, parav@mellanox.com, kvm@vger.kernel.org,
 netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvOC80IOS4i+WNiDU6MjEsIFpodSwgTGluZ3NoYW4gd3JvdGU6Cj4+PiBIaSBKYXNv
biwKPj4+Cj4+PiB3ZSB1c2UgdGhpcyBsb2NrIHRvIHByb3RlY3QgdGhlIGV2ZW50ZmRfY3R4IGFu
ZCBpcnEgZnJvbSByYWNlIAo+Pj4gY29uZGl0aW9ucywKPj4KPj4KPj4gV2UgZG9uJ3Qgc3VwcG9y
dCBpcnEgbm90aWZpY2F0aW9uIGZyb20gdkRQQSBkZXZpY2UgZHJpdmVyIGluIHRoaXMgCj4+IHZl
cnNpb24sIGRvIHdlIHN0aWxsIGhhdmUgcmFjZSBjb25kaXRpb24/Cj4gYXMgd2UgZGlzY3Vzc2Vk
IGJlZm9yZToKPiAoMSlpZiB2ZW5kb3IgY2hhbmdlIElSUSBhZnRlciBEUklWRVJfT0ssIHRocm91
Z2ggdGhleSBzaG91bGQgbm90IGRvIHRoaXMsIGJ1dCB0aGV5IGNhbi4KPiAoMilpZiB1c2VyIHNw
YWNlIGNoYW5nZXMgY3R4Lgo+Cj4gVGhhbmtzCgoKWWVzLCBidXQgdGhlbiBldmVyeXRoaW5nIGhh
cHBlbnMgaW4gY29udGV4dCBvZiBzeXNjYWxsIChpb2N0bCksIHNvIHZxIAptdXRleCBpcyBzdWZm
aWNpZW50IEkgZ3Vlc3M/CgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
