Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D401EB645
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 09:13:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0EFF987658;
	Tue,  2 Jun 2020 07:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oY0Zyi2Toeka; Tue,  2 Jun 2020 07:12:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 81EA48764A;
	Tue,  2 Jun 2020 07:12:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6940BC016E;
	Tue,  2 Jun 2020 07:12:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E97BBC016E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 07:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D7E9485A57
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 07:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zm3pKH2VTaj6
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 07:12:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 50C2E86044
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 07:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591081975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P0Hsyk/buplzmPpjkWUnfP95pA3HShavyi16EwRZaII=;
 b=OE+84BJvqMHFEep5iTglu7KsSiMSrlJis+LG/S17v3p2PqVXFoe+xwysJWbAoymu81xV/V
 TrYwaZ7ywODSwiBgYuFKE8MYNPxbe06wfqonEt6cnjGgV1iae16FJtaRc0kNcmL1RgVMCe
 lMhClwqKRGyqU7Ib8QWLIwyIxWaMelU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-6a247yFiPJyTotLRLcin1w-1; Tue, 02 Jun 2020 03:12:52 -0400
X-MC-Unique: 6a247yFiPJyTotLRLcin1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66269835B40;
 Tue,  2 Jun 2020 07:12:50 +0000 (UTC)
Received: from [10.72.12.102] (ovpn-12-102.pek2.redhat.com [10.72.12.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3CF860F8D;
 Tue,  2 Jun 2020 07:12:31 +0000 (UTC)
Subject: Re: [PATCH 5/6] vdpa: introduce virtio pci driver
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200529080303.15449-1-jasowang@redhat.com>
 <20200529080303.15449-6-jasowang@redhat.com>
 <20200602010809-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e722bb62-2a72-779a-f542-1096e8f609b8@redhat.com>
Date: Tue, 2 Jun 2020 15:12:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602010809-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Ck9uIDIwMjAvNi8yIOS4i+WNiDE6MDksIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBG
cmksIE1heSAyOSwgMjAyMCBhdCAwNDowMzowMlBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBOb3RlIHRoYXQgc2luY2UgdmlydGlvIHNwZWNpZmljYXRpb24gZG9lcyBub3Qgc3VwcG9ydCBn
ZXQvcmVzdG9yZQo+PiB2aXJ0cXVldWUgc3RhdGUuIFNvIHdlIGNhbiBub3QgdXNlIHRoaXMgZHJp
dmVyIGZvciBWTS4gVGhpcyBjYW4gYmUKPj4gYWRkcmVzc2VkIGJ5IGV4dGVuZGluZyB0aGUgdmly
dGlvIHNwZWNpZmljYXRpb24uCj4gTG9va3MgbGlrZSBleGFjdGx5IHRoZSBraW5kIG9mIGhhcmR3
YXJlIGxpbWl0YXRpb24gVkRQQSBpcyBzdXBwb3NlZCB0bwo+IHBhcGVyIG92ZXIgd2l0aGluIGd1
ZXN0LiBTbyBJIHN1Z2dlc3Qgd2UgdXNlIHRoaXMgYXMKPiBhIGxpdG11cyB0ZXN0LCBhbmQgZmlu
ZCB3YXlzIGZvciBWRFBBIHRvIGhhbmRsZSB0aGlzIHdpdGhvdXQKPiBzcGVjIGNoYW5nZXMuCgoK
WWVzLCBhbmQganVzdCB0byBjb25maXJtLCBkbyB5b3UgdGhpbmsgaXQncyBiZW5lZmljaWFsIHRv
IGV4dGVuZCB2aXJ0aW8gCnNwZWNpZmljYXRpb24gdG8gc3VwcG9ydCBzdGF0ZSBnZXQvc2V0PwoK
VGhhbmtzCgoKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
