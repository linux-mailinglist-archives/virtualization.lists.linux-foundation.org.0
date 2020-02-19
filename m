Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F2599163CB9
	for <lists.virtualization@lfdr.de>; Wed, 19 Feb 2020 06:36:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7B6078643F;
	Wed, 19 Feb 2020 05:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PIEqMM+V9bDn; Wed, 19 Feb 2020 05:36:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7C41B864F4;
	Wed, 19 Feb 2020 05:36:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F0A5C013E;
	Wed, 19 Feb 2020 05:36:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66E88C013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 05:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5C9BF203E4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 05:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LXT4IdFQzMrO
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 05:35:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 0EDBD20343
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 05:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582090557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FnMyrS2ffrGzjTv2kAsMGrfcVGfLXQvqbV7CHWKXWPg=;
 b=SYM+a0sGlezWhDA11SWSOykhpntWmgm55zDD1vWYe1XfjOBr+pXoBvvbW+C/6jUw1e8UNt
 +mSmKwt2PZRWekgFIGRm7jqR+1z8er1NJb3evbQ6EvYD5VoCfL9LuuUL+XwpGszzsTem0d
 g866ccK2XYY2MX/FV/QLRp4aVo9WQ14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-wJx9yaKzM8O55fVO3NXE4Q-1; Wed, 19 Feb 2020 00:35:52 -0500
X-MC-Unique: wJx9yaKzM8O55fVO3NXE4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E95B1085925;
 Wed, 19 Feb 2020 05:35:49 +0000 (UTC)
Received: from [10.72.13.212] (ovpn-13-212.pek2.redhat.com [10.72.13.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44D3D87B1A;
 Wed, 19 Feb 2020 05:35:27 +0000 (UTC)
Subject: Re: [PATCH V2 3/5] vDPA: introduce vDPA bus
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200211134746.GI4271@mellanox.com>
 <cf7abcc9-f8ef-1fe2-248e-9b9028788ade@redhat.com>
 <20200212125108.GS4271@mellanox.com>
 <12775659-1589-39e4-e344-b7a2c792b0f3@redhat.com>
 <20200213134128.GV4271@mellanox.com>
 <ebaea825-5432-65e2-2ab3-720a8c4030e7@redhat.com>
 <20200213150542.GW4271@mellanox.com>
 <8b3e6a9c-8bfd-fb3c-12a8-2d6a3879f1ae@redhat.com>
 <20200214135232.GB4271@mellanox.com>
 <01c86ebb-cf4b-691f-e682-2d6f93ddbcf7@redhat.com>
 <20200218135608.GS4271@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bbfc608b-2bfa-e4c7-c2b9-dbcfe63518cb@redhat.com>
Date: Wed, 19 Feb 2020 13:35:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200218135608.GS4271@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
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

Ck9uIDIwMjAvMi8xOCDkuIvljYg5OjU2LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gTW9u
LCBGZWIgMTcsIDIwMjAgYXQgMDI6MDg6MDNQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPgo+
PiBJIHRob3VnaHQgeW91IHdlcmUgY29waWVkIGluIHRoZSBwYXRjaCBbMV0sIG1heWJlIHdlIGNh
biBtb3ZlIHZob3N0IHJlbGF0ZWQKPj4gZGlzY3Vzc2lvbiB0aGVyZSB0byBhdm9pZCBjb25mdXNp
b24uCj4+Cj4+IFsxXSBodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvODExMjEwLwo+IFdvdywgdGhh
dCBpcyAuLiBjb25mdXNpbmcuCj4KPiBTbyB0aGlzIGlzIHN1cHBvc2VkIHRvIGR1cGxpY2F0ZSB0
aGUgdUFQSSBvZiB2aG9zdC11c2VyPwoKCkl0IHRyaWVzIHRvIHJldXNlIHRoZSB1QVBJIG9mIHZo
b3N0IHdpdGggc29tZSBleHRlbnNpb24uCgoKPiBCdXQgaXQgaXMKPiBvcGVuIGNvZGVkIGFuZCBk
dXBsaWNhdGVkIGJlY2F1c2UgLi4gdmRwYT8KCgpJJ20gbm90IHN1cmUgSSBnZXQgaGVyZSwgdmhv
c3QgbW9kdWxlIGlzIHJldXNlZCBmb3Igdmhvc3QtdmRwYSBhbmQgYWxsIApjdXJyZW50IHZob3N0
IGRldmljZSAoZS5nIG5ldCkgdXNlcyB0aGVpciBvd24gY2hhciBkZXZpY2UuCgoKPgo+PiBTbyBp
dCdzIGNoZWFwZXIgYW5kIHNpbXBsZXIgdG8gaW50cm9kdWNlIGEgbmV3IGJ1cyBpbnN0ZWFkIG9m
IHJlZmFjdG9yaW5nIGEKPj4gd2VsbCBrbm93biBidXMgYW5kIEFQSSB3aGVyZSBicnVuY2hlcyBv
ZiBkcml2ZXJzIGFuZCBkZXZpY2VzIGhhZCBiZWVuCj4+IGltcGxlbWVudGVkIGZvciB5ZWFycy4K
PiBJZiB5b3UgcmVhc29uIGZvciB0aGlzIGFwcHJvYWNoIGlzIHRvIGVhc2UgdGhlIGltcGxlbWVu
dGF0aW9uIHRoZW4geW91Cj4gc2hvdWxkIHRhbGsgYWJvdXQgaXQgaW4gdGhlIGNvdmVyIGxldHRl
cnMvZXRjCgoKSSB3aWxsIGFkZCBtb3JlIHJhdGlvbmFsZSBpbiBib3RoIGNvdmVyIGxldHRlciBh
bmQgdGhpcyBwYXRjaC4KClRoYW5rcwoKCj4KPiBNYXliZSBpdCBpcyByZWFzb25hYmxlIHRvIGRv
IHRoaXMgYmVjYXVzZSB0aGUgcmV3b3JrIGlzIHRvbyBncmVhdCwgSQo+IGRvbid0IGtub3csIGJ1
dCB0byBtZSB0aGlzIHdob2xlIHRoaW5nIGxvb2tzIHJhdGhlciBtZXNzeS4KPgo+IFJlbWVtYmVy
IHRoaXMgc3R1ZmYgaXMgYWxsIHVBUEkgYXMgaXQgc2hvd3MgdXAgaW4gc3lzZnMsIHNvIHlvdSBj
YW4KPiBlYXNpbGx5IGdldCBzdHVjayB3aXRoIGl0IGZvcmV2ZXIuCj4KPiBKYXNvbgo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlv
biBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVh
bGl6YXRpb24=
