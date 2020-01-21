Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B933D1435EA
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 04:33:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2AD1E20493;
	Tue, 21 Jan 2020 03:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zHEI5jU8D-kB; Tue, 21 Jan 2020 03:33:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6A53C204BA;
	Tue, 21 Jan 2020 03:33:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 496BEC0174;
	Tue, 21 Jan 2020 03:33:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6BD07C0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 03:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 531F9860A2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 03:33:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nt7nHE0FExPA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 03:33:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0C86F85DB1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 03:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579577587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZ9hoh4EXoAUSSoaNodF/53MT2MqP0i4YheKRaQPqJ0=;
 b=jDGbw4I2SK2BgOroGeQINVP4J8nlLqhr6RrJ8fpAMNp3CnjESfEsO5vby4g3jQAcZlNrT2
 1Ue4uusDG3T6njGq920JYpXTshYHahpgTXl+ORcMC+etJsp3wQq+QVyPjtqXSHQEo+YS6d
 D/k8J4PhP+K6ZV3ZUnmM/g+qHLYo/H4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-IXrE8Sy2N--LpvrBi-r7Rg-1; Mon, 20 Jan 2020 22:33:05 -0500
X-MC-Unique: IXrE8Sy2N--LpvrBi-r7Rg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F6FD107ACC4;
 Tue, 21 Jan 2020 03:33:02 +0000 (UTC)
Received: from [10.72.12.208] (ovpn-12-208.pek2.redhat.com [10.72.12.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3646D5C290;
 Tue, 21 Jan 2020 03:32:44 +0000 (UTC)
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200117070324-mutt-send-email-mst@kernel.org>
 <239b042c-2d9e-0eec-a1ef-b03b7e2c5419@redhat.com>
 <CAJPjb1+fG9L3=iKbV4Vn13VwaeDZZdcfBPvarogF_Nzhk+FnKg@mail.gmail.com>
 <AM0PR0502MB379553984D0D55FDE25426F6C3330@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <20200119045849-mutt-send-email-mst@kernel.org>
 <d4e7fc56-c9d8-f01f-1504-dd49d5658037@redhat.com>
 <20200120070710-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f5860f7e-f6c1-5bc7-53f5-c4badddfdfe4@redhat.com>
Date: Tue, 21 Jan 2020 11:32:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200120070710-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Rob Miller <rob.miller@broadcom.com>, "lulu@redhat.com" <lulu@redhat.com>,
 "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Shahaf Shuler <shahafs@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, "Wang,
 Xiao W" <xiao.w.wang@intel.com>, "stefanha@redhat.com" <stefanha@redhat.com>,
 "Wang, Zhihong" <zhihong.wang@intel.com>, Netdev <netdev@vger.kernel.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvMS8yMCDkuIvljYg4OjA5LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
TW9uLCBKYW4gMjAsIDIwMjAgYXQgMDQ6NDQ6MzRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMC8xLzE5IOS4i+WNiDU6NTksIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIFN1biwgSmFuIDE5LCAyMDIwIGF0IDA5OjA3OjA5QU0gKzAwMDAsIFNoYWhhZiBTaHVsZXIg
d3JvdGU6Cj4+Pj4+IFRlY2huaWNhbGx5LCB3ZSBjYW4ga2VlcCB0aGUgaW5jcmVtZW50YWwgQVBJ
Cj4+Pj4+IGhlcmUgYW5kIGxldCB0aGUgdmVuZG9yIHZEUEEgZHJpdmVycyB0byByZWNvcmQgdGhl
IGZ1bGwgbWFwcGluZwo+Pj4+PiBpbnRlcm5hbGx5IHdoaWNoIG1heSBzbGlnaHRseSBpbmNyZWFz
ZSB0aGUgY29tcGxleGl0eSBvZiB2ZW5kb3IgZHJpdmVyLgo+Pj4+IFdoYXQgd2lsbCBiZSB0aGUg
dHJpZ2dlciBmb3IgdGhlIGRyaXZlciB0byBrbm93IGl0IHJlY2VpdmVkIHRoZSBsYXN0IG1hcHBp
bmcgb24gdGhpcyBzZXJpZXMgYW5kIGl0IGNhbiBub3cgcHVzaCBpdCB0byB0aGUgb24tY2hpcCBJ
T01NVT8KPj4+IFNvbWUga2luZCBvZiBpbnZhbGlkYXRlIEFQST8KPj4+Cj4+IFRoZSBwcm9ibGVt
IGlzIGhvdyB0byBkZWFsIHdpdGggdGhlIGNhc2Ugb2YgdklPTU1VLiBXaGVuIHZJT01NVSBpcyBl
bmFibGluZwo+PiB0aGVyZSdzIG5vIGNvbmNlcHQgb2YgbGFzdCBtYXBwaW5nLgo+Pgo+PiBUaGFu
a3MKPiBNb3N0IElPTU1VcyBoYXZlIGEgdHJhbnNsYXRpb24gY2FjaGUgc28gaGF2ZSBhbiBpbnZh
bGlkYXRlIEFQSSB0b28uCgoKT2ssIHRoZW4gSSBnZXQgeW91LgoKQnV0IGluIHRoaXMgY2FzZSwg
d2hlbiB2SU9NTVUgaXMgZW5hYmxlZCwgZWFjaCBuZXcgbWFwIGJlY2FtZSBhICJsYXN0IAptYXBw
aW5nIi4KClRoYW5rcwoKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
