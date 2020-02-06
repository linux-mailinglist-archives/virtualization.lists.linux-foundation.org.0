Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D747153D63
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 04:12:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5702484DBD;
	Thu,  6 Feb 2020 03:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYnYVpYxfBLv; Thu,  6 Feb 2020 03:12:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8E9D2860D2;
	Thu,  6 Feb 2020 03:12:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69070C08A4;
	Thu,  6 Feb 2020 03:12:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2097FC08A4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 03:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 073868789C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 03:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2RMIgCEFvmqB
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 03:12:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3749287524
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 03:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580958731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RspSNO+p1yr02wpcehjk1h3AeZBEyxIwLa/kF1BxhEY=;
 b=ialgYWUaX0poOWsQYFzKLy47fkwqVrDqRinIzBe9X0kE5LpoxtiVJ7+sxyhU4/VcrT8BLy
 mzzhDbR5SmMtvtcJwfrykgvY4s2sbWRyPYm4k0rDNs+4pD9CtbjS5SF1b08N/oKodT79ZD
 cCeysrTHDrCw0bbxQRqAvt91h2L0vzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-IABUdiBpNvaQmA4HuVYVBQ-1; Wed, 05 Feb 2020 22:12:10 -0500
X-MC-Unique: IABUdiBpNvaQmA4HuVYVBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4495D8018A5;
 Thu,  6 Feb 2020 03:12:07 +0000 (UTC)
Received: from [10.72.13.85] (ovpn-13-85.pek2.redhat.com [10.72.13.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AAA85C1B2;
 Thu,  6 Feb 2020 03:11:53 +0000 (UTC)
Subject: Re: [PATCH] vhost: introduce vDPA based backend
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <7aab2892-bb19-a06a-a6d3-9c28bc4c3400@redhat.com>
 <20200205020247.GA368700@___>
 <AM0PR0502MB37952015716C1D5E07E390B6C3020@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <112858a4-1a01-f4d7-e41a-1afaaa1cad45@redhat.com>
 <20200205125648.GV23346@mellanox.com>
 <20200205081210-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <55b050d6-b31d-f8a2-2a15-0fc68896d47f@redhat.com>
Date: Thu, 6 Feb 2020 11:11:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200205081210-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Shahaf Shuler <shahafs@mellanox.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "hanand@xilinx.com" <hanand@xilinx.com>, Parav Pandit <parav@mellanox.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>
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

Ck9uIDIwMjAvMi81IOS4i+WNiDk6MTQsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBX
ZWQsIEZlYiAwNSwgMjAyMCBhdCAwODo1Njo0OEFNIC0wNDAwLCBKYXNvbiBHdW50aG9ycGUgd3Jv
dGU6Cj4+IE9uIFdlZCwgRmViIDA1LCAyMDIwIGF0IDAzOjUwOjE0UE0gKzA4MDAsIEphc29uIFdh
bmcgd3JvdGU6Cj4+Pj4gV291bGQgaXQgYmUgYmV0dGVyIGZvciB0aGUgbWFwL3VtbmFwIGxvZ2lj
IHRvIGhhcHBlbiBpbnNpZGUgZWFjaCBkZXZpY2UgPwo+Pj4+IERldmljZXMgdGhhdCBuZWVkcyB0
aGUgSU9NTVUgd2lsbCBjYWxsIGlvbW11IEFQSXMgZnJvbSBpbnNpZGUgdGhlIGRyaXZlciBjYWxs
YmFjay4KPj4+IFRlY2huaWNhbGx5LCB0aGlzIGNhbiB3b3JrLiBCdXQgaWYgaXQgY2FuIGJlIGRv
bmUgYnkgdmhvc3QtdnBkYSBpdCB3aWxsIG1ha2UKPj4+IHRoZSB2RFBBIGRyaXZlciBtb3JlIGNv
bXBhY3QgYW5kIGVhc2llciB0byBiZSBpbXBsZW1lbnRlZC4KPj4gR2VuZXJhbGx5IHNwZWFraW5n
LCBpbiB0aGUga2VybmVsLCBpdCBpcyBub3JtYWwgdG8gbm90IGhvaXN0IGNvZGUgb2YKPj4gb3V0
IGRyaXZlcnMgaW50byBzdWJzeXN0ZW1zIHVudGlsIDItMyBkcml2ZXJzIGFyZSBkdXBsaWNhdGlu
ZyB0aGF0Cj4+IGNvZGUuIEl0IGhlbHBzIGVuc3VyZSB0aGUgcmlnaHQgZGVzaWduIGlzIHVzZWQK
Pj4KPj4gSmFzb24KPiBUaGF0J3MgdXAgdG8gdGhlIHN5YnN5c3RlbSBtYWludGFpbmVyIHJlYWxs
eSwgYXMgdGhlcmUncyBhbHNvIHNvbWUKPiBpbnR1aXRpb24gaW52b2x2ZWQgaW4gZ3Vlc3Npbmcg
YSBzcGVjaWZpYyBBUEkgaXMgd2lkZWx5IHVzZWZ1bC4KPiBJbi1rZXJuZWwgQVBJcyBhcmUgZmxl
eGlibGUsIGlmIHdlIGZpbmQgc29tZXRoaW5nIGlzbid0IG5lZWRlZCB3ZSBqdXN0Cj4gZHJvcCBp
dC4KPgoKSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseS4gQXQgbGVhc3QgSW50ZWwgKExpbmcgU2hh
bikgYW5kIEJyb2Rjb20gKFJvYikgCmRvZXNuJ3Qgd2FudCB0byBkZWFsIHdpdGggRE1BIHN0dWZm
cyBpbiB0aGVpciBkcml2ZXIuCgpBbnl3YXkgc2luY2UgdGhlIERNQSBidXMgb3BlcmF0aW9ucyBp
cyBvcHRpb25hbCwgZHJpdmVyIG1heSBzdGlsbCBjaG9vc2UgCnRvIGRvIERNQSBieSBpdHNlbGYg
aWYgdGhleSB3YW50IGV2ZW4gaWYgaXQgcmVxdWlyZXMgcGxhdGZvcm0gSU9NTVUgdG8gd29yay4K
ClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
