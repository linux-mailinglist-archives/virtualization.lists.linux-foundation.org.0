Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F601514EA
	for <lists.virtualization@lfdr.de>; Tue,  4 Feb 2020 05:19:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6A86986947;
	Tue,  4 Feb 2020 04:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id js-btmG66lCz; Tue,  4 Feb 2020 04:19:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C7F5D8653F;
	Tue,  4 Feb 2020 04:19:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2144C0174;
	Tue,  4 Feb 2020 04:19:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3771C0174
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 04:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EF4E5864B8
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 04:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2xTlNyr5w53I
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 04:19:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 33F7A8643B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 04:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580789990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qnJ7pfLwugdYhxtD4QkD0UVYEM/OAM1UnVZIU6mM8I8=;
 b=TMmBB64q+kN6FVe7DjZ2lgdnEr53dwQ96sHocmIr5exVXm+7+MA0WpZfJ/Y68ss2du8jf8
 ivD88Y1nktNC951cWLnlSLa8P2oA9bO01iSy8bcl0OwiqFH+ZWgBCnYc9/YarK1aiuVwAN
 25ztiPKhoRAr6CcCxxboEarBWWJvIMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-0vUHyZWFNFOwOQXfk-hPwA-1; Mon, 03 Feb 2020 23:19:49 -0500
X-MC-Unique: 0vUHyZWFNFOwOQXfk-hPwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 658278017DF;
 Tue,  4 Feb 2020 04:19:46 +0000 (UTC)
Received: from [10.72.12.170] (ovpn-12-170.pek2.redhat.com [10.72.12.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3602B5C1D4;
 Tue,  4 Feb 2020 04:19:29 +0000 (UTC)
Subject: Re: [PATCH 5/5] vdpasim: vDPA device simulator
To: Jason Gunthorpe <jgg@mellanox.com>, Parav Pandit <parav@mellanox.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-6-jasowang@redhat.com>
 <20200116154658.GJ20978@mellanox.com>
 <aea2bff8-82c8-2c0f-19ee-e86db73e199f@redhat.com>
 <20200117141021.GW20978@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d53a864c-d96f-ccac-78ad-0c596bda2718@redhat.com>
Date: Tue, 4 Feb 2020 12:19:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200117141021.GW20978@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "kuba@kernel.org" <kuba@kernel.org>, Shahaf Shuler <shahafs@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvMS8xNyDkuIvljYgxMDoxMCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+Pj4+IE5l
dGxpbmsgYmFzZWQgbGlmZWN5Y2xlIG1hbmFnZW1lbnQgY291bGQgYmUgaW1wbGVtZW50ZWQgZm9y
IHZEUEEKPj4+PiBzaW11bGF0b3IgYXMgd2VsbC4KPj4+IFRoaXMgaXMganVzdCBiZWdnaW5nIGZv
ciBhIG5ldGxpbmsgYmFzZWQgYXBwcm9hY2guCj4+Pgo+Pj4gQ2VydGFpbmx5IG5ldGxpbmsgZHJp
dmVuIHJlbW92YWwgc2hvdWxkIGJlIGFuIGFncmVlYWJsZSBzdGFuZGFyZCBmb3IKPj4+IGFsbCBk
ZXZpY2VzLCBJIHRoaW5rLgo+PiBXZWxsLCBJIHRoaW5rIFBhcmF2IGhhZCBzb21lIHByb3Bvc2Fs
cyBkdXJpbmcgdGhlIGRpc2N1c3Npb24gb2YgbWRldgo+PiBhcHByb2FjaC4gQnV0IEknbSBub3Qg
c3VyZSBpZiBoZSBoYWQgYW55IFJGQyBjb2RlcyBmb3IgbWUgdG8gaW50ZWdyYXRlIGl0Cj4+IGlu
dG8gdmRwYXNpbS4KPj4KPj4gT3IgZG8geW91IHdhbnQgbWUgdG8gcHJvcG9zZSB0aGUgbmV0bGlu
ayBBUEk/IElmIHllcywgd291bGQgeW91IHByZWZlciB0byBhCj4+IG5ldyB2aXJ0aW8gZGVkaWNh
dGVkIG9uZSBvciBiZSBhIHN1YnNldCBvZiBkZXZsaW5rPwo+IFdlbGwsIGxldHMgc2VlIHdoYXQg
ZmVlZCBiYWNrIFBhcmF2IGhhcwo+Cj4gSmFzb24KCgpIaSBQYXJhdjoKCkRvIHlvdSBoYXZlIGFu
eSB1cGRhdGUgb24gdGhpcz8gSWYgaXQgc3RpbGwgcmVxdWlyZSBzb21ldGltZSwgSSB3aWxsIApw
b3N0IFYyIHRoYXQgc3RpY2tzIHRvIHN5c2ZzIGJhc2VkIEFQSS4KClRoYW5rcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
