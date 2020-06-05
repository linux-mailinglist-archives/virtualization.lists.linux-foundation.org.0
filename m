Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 382151EF372
	for <lists.virtualization@lfdr.de>; Fri,  5 Jun 2020 10:54:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DBDA888B1F;
	Fri,  5 Jun 2020 08:54:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GTdcz1aTUnnJ; Fri,  5 Jun 2020 08:54:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6B0B188B1C;
	Fri,  5 Jun 2020 08:54:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F92FC016E;
	Fri,  5 Jun 2020 08:54:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07692C016E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 08:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E7C6C889B1
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 08:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NX7-AuPqL8H9
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 08:54:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5A2EF889AF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 08:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591347272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0r/b2eFY9+k9/mVafvta/fNndA6rDDpBttvueSmSAvo=;
 b=F6Dax2qNayJ0Yfu8rSmKb0xWrDYZzRI4XTD9hIP+VlIDBK/lhMjOD2rrkBXgext29dkb1g
 AH+3WWfthoxx5CQhnzyffVxRP+LEUulMv7AP60zbLR3bDXgec+/YM4HtsAGSsKf8O+8LQP
 tXQWk5MEZrgmFM0ukCJzLTprxizd3EI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-kMNLCwG-MMGG8qw_EOqPGw-1; Fri, 05 Jun 2020 04:54:31 -0400
X-MC-Unique: kMNLCwG-MMGG8qw_EOqPGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B6EC107ACF9;
 Fri,  5 Jun 2020 08:54:28 +0000 (UTC)
Received: from [10.72.12.233] (ovpn-12-233.pek2.redhat.com [10.72.12.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 918D519C58;
 Fri,  5 Jun 2020 08:54:19 +0000 (UTC)
Subject: Re: [PATCH 5/6] vdpa: introduce virtio pci driver
From: Jason Wang <jasowang@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200529080303.15449-1-jasowang@redhat.com>
 <20200529080303.15449-6-jasowang@redhat.com>
 <20200602010332-mutt-send-email-mst@kernel.org>
 <5dbb0386-beeb-5bf4-d12e-fb5427486bb8@redhat.com>
Message-ID: <6b1d1ef3-d65e-08c2-5b65-32969bb5ecbc@redhat.com>
Date: Fri, 5 Jun 2020 16:54:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <5dbb0386-beeb-5bf4-d12e-fb5427486bb8@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: shahafs@mellanox.com, lulu@redhat.com, kvm@vger.kernel.org,
 saugatm@xilinx.com, netdev@vger.kernel.org, mhabets@solarflare.com,
 vmireyno@marvell.com, linux-kernel@vger.kernel.org, gdawar@xilinx.com,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, zhangweining@ruijie.com.cn, eli@mellanox.com,
 lingshan.zhu@intel.com, rob.miller@broadcom.com
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

Ck9uIDIwMjAvNi8yIOS4i+WNiDM6MDgsIEphc29uIFdhbmcgd3JvdGU6Cj4+Cj4+PiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIHZwX3ZkcGFfaWRfdGFibGVbXSA9IHsKPj4+ICvC
oMKgwqAgeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfUkVESEFUX1FVTVJBTkVULCBQQ0lfQU5Z
X0lEKSB9LAo+Pj4gK8KgwqDCoCB7IDAgfQo+Pj4gK307Cj4+IFRoaXMgbG9va3MgbGlrZSBpdCds
bCBjcmVhdGUgYSBtZXNzIHdpdGggZWl0aGVyIHZpcnRpbyBwY2kKPj4gb3IgdmRwYSBiZWluZyBs
b2FkZWQgYXQgcmFuZG9tLiBNYXliZSBqdXN0IGRvbid0IHNwZWNpZnkKPj4gYW55IElEcyBmb3Ig
bm93LiBEb3duIHRoZSByb2FkIHdlIGNvdWxkIGdldCBhCj4+IGRpc3RpbmN0IHZlbmRvciBJRCBv
ciBhIHJhbmdlIG9mIGRldmljZSBJRHMgZm9yIHRoaXMuCj4KPgo+IFJpZ2h0LCB3aWxsIGRvLgo+
Cj4gVGhhbmtzIAoKClJldGhpbmsgYWJvdXQgdGhpcy4gSWYgd2UgZG9uJ3Qgc3BlY2lmeSBhbnkg
SUQsIHRoZSBiaW5kaW5nIHdvbid0IHdvcmsuCgpIb3cgYWJvdXQgdXNpbmcgYSBkZWRpY2F0ZWQg
c3Vic3lzdGVtIHZlbmRvciBpZCBmb3IgdGhpcz8KClRoYW5rcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
