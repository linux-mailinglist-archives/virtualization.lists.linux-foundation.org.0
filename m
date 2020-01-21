Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9E11437F3
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 08:58:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9C6E185BDF;
	Tue, 21 Jan 2020 07:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22rXWFscQHGV; Tue, 21 Jan 2020 07:58:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1B865843BD;
	Tue, 21 Jan 2020 07:58:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06D7DC0174;
	Tue, 21 Jan 2020 07:58:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EE9BC0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 07:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2CC6F87916
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 07:58:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KyWCiygM8d2F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 07:57:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 961A2878FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 07:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579593472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fHgdj4+QyHLUaUegzU6HDHgoygSNPCN+x1Fke+h7szM=;
 b=FcoTTLoGB9J5UGg299GDJZMK7IKLIf1/AiGGqvm1xb7K4gZUVsVjplczud2Ji62ohpFS4U
 ZI8ZT3y8phx+YqKQv7jxHp2hVUl5U2uyIFyTyUq4mv/QpjtKCa5KtNxZK+n/EBTEVru52t
 MlcuLvuw/zZjMyFpGeX4TkoGzTw6240=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-mcFzT5QdNfSlCBvpmZk-Kg-1; Tue, 21 Jan 2020 02:57:50 -0500
X-MC-Unique: mcFzT5QdNfSlCBvpmZk-Kg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE3871005510;
 Tue, 21 Jan 2020 07:57:46 +0000 (UTC)
Received: from [10.72.12.103] (ovpn-12-103.pek2.redhat.com [10.72.12.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A313319C6A;
 Tue, 21 Jan 2020 07:57:30 +0000 (UTC)
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
To: Shahaf Shuler <shahafs@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20200116124231.20253-4-jasowang@redhat.com>
 <20200117070324-mutt-send-email-mst@kernel.org>
 <239b042c-2d9e-0eec-a1ef-b03b7e2c5419@redhat.com>
 <CAJPjb1+fG9L3=iKbV4Vn13VwaeDZZdcfBPvarogF_Nzhk+FnKg@mail.gmail.com>
 <AM0PR0502MB379553984D0D55FDE25426F6C3330@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <d69918ca-8af4-44b2-9652-633530d4c113@redhat.com>
 <20200120174933.GB3891@mellanox.com>
 <AM0PR0502MB3795C92485338180FC8059CFC3320@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <20200120162449-mutt-send-email-mst@kernel.org>
 <AM0PR0502MB3795A7BE7F434964D6102517C3320@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <20200120165640-mutt-send-email-mst@kernel.org>
 <AM0PR0502MB3795940D8E0A269D4A32FF8FC30D0@AM0PR0502MB3795.eurprd05.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ef3ca685-2cbe-ce7c-c9c0-cbb5caa08db2@redhat.com>
Date: Tue, 21 Jan 2020 15:57:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AM0PR0502MB3795940D8E0A269D4A32FF8FC30D0@AM0PR0502MB3795.eurprd05.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 Jason Gunthorpe <jgg@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>, "Wang, Xiao W" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>, Netdev <netdev@vger.kernel.org>,
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

Ck9uIDIwMjAvMS8yMSDkuIvljYgyOjAxLCBTaGFoYWYgU2h1bGVyIHdyb3RlOgo+IFR1ZXNkYXks
IEphbnVhcnkgMjEsIDIwMjAgMTI6MDAgQU0sIE1pY2hhZWwgUy4gVHNpcmtpbjoKPj4gU3ViamVj
dDogUmU6IFtQQVRDSCAzLzVdIHZEUEE6IGludHJvZHVjZSB2RFBBIGJ1cwo+Pgo+PiBPbiBNb24s
IEphbiAyMCwgMjAyMCBhdCAwOTo0NzoxOFBNICswMDAwLCBTaGFoYWYgU2h1bGVyIHdyb3RlOgo+
Pj4gTW9uZGF5LCBKYW51YXJ5IDIwLCAyMDIwIDExOjI1IFBNLCBNaWNoYWVsIFMuIFRzaXJraW46
Cj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzVdIHZEUEE6IGludHJvZHVjZSB2RFBBIGJ1cwo+
Pj4+Cj4+Pj4gT24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMDg6NTE6NDNQTSArMDAwMCwgU2hhaGFm
IFNodWxlciB3cm90ZToKPj4+Pj4gTW9uZGF5LCBKYW51YXJ5IDIwLCAyMDIwIDc6NTAgUE0sIEph
c29uIEd1bnRob3JwZToKPj4+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMy81XSB2RFBBOiBpbnRy
b2R1Y2UgdkRQQSBidXMKPj4+Pj4+Cj4+Pj4+PiBPbiBNb24sIEphbiAyMCwgMjAyMCBhdCAwNDo0
Mzo1M1BNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+Pj4+IFRoaXMgaXMgc2ltaWxhciB0
byB0aGUgZGVzaWduIG9mIHBsYXRmb3JtIElPTU1VIHBhcnQgb2YKPj4+Pj4+PiB2aG9zdC12ZHBh
LiBXZSBkZWNpZGUgdG8gc2VuZCBkaWZmcyB0byBwbGF0Zm9ybSBJT01NVSB0aGVyZS4KPj4+Pj4+
PiBJZiBpdCdzIG9rIHRvIGRvIHRoYXQgaW4gZHJpdmVyLCB3ZSBjYW4gcmVwbGFjZSBzZXRfbWFw
IHdpdGgKPj4+Pj4+PiBpbmNyZW1lbnRhbCBBUEkKPj4+PiBsaWtlIG1hcCgpL3VubWFwKCkuCj4+
Pj4+Pj4gVGhlbiBkcml2ZXIgbmVlZCB0byBtYWludGFpbiByYnRyZWUgaXRzZWxmLgo+Pj4+Pj4g
SSB0aGluayB3ZSByZWFsbHkgbmVlZCB0byBzZWUgdHdvIG1vZGVzLCBvbmUgd2hlcmUgdGhlcmUg
aXMgYQo+Pj4+Pj4gZml4ZWQgdHJhbnNsYXRpb24gd2l0aG91dCBkeW5hbWljIHZJT01NVSBkcml2
ZW4gY2hhbmdlcyBhbmQgb25lCj4+Pj4+PiB0aGF0IHN1cHBvcnRzIHZJT01NVS4KPj4+Pj4+Cj4+
Pj4+PiBUaGVyZSBhcmUgZGlmZmVyZW50IG9wdGltaXphdGlvbiBnb2FscyBpbiB0aGUgZHJpdmVy
cyBmb3IgdGhlc2UKPj4+Pj4+IHR3byBjb25maWd1cmF0aW9ucy4KPj4+Pj4gKzEuCj4+Pj4+IEl0
IHdpbGwgYmUgYmVzdCB0byBoYXZlIG9uZSBBUEkgZm9yIHN0YXRpYyBjb25maWcgKGkuZS4gbWFw
cGluZwo+Pj4+PiBjYW4gYmUgc2V0IG9ubHkgYmVmb3JlIHZpcnRpbyBkZXZpY2UgZ2V0cyBhY3Rp
dmUpLCBhbmQgb25lIEFQSSBmb3IKPj4+Pj4gZHluYW1pYyBjaGFuZ2VzIHRoYXQgY2FuIGJlIHNl
dCBhZnRlciB0aGUgdmlydGlvIGRldmljZSBpcyBhY3RpdmUuCj4+Pj4gRnJhbmtseSBJIGRvbid0
IHNlZSB3aGVuIHdlJ2QgdXNlIHRoZSBzdGF0aWMgb25lLgo+Pj4+IE1lbW9yeSBob3RwbHVnIGlz
IGVuYWJsZWQgZm9yIG1vc3QgZ3Vlc3RzLi4uCj4+PiBUaGUgZmFjdCBtZW1vcnkgaG90cGx1ZyBp
cyBlbmFibGVkIGRvZXNuJ3QgbmVjZXNzYXJpbHkgbWVhbnMgdGhlcmUgaXMgbm90Cj4+IGNvbGQt
cGx1Z2dlZCBtZW1vcnkgb24gdGhlIGhvdCBwbHVnZ2VkIHNsb3RzLgo+Pj4gU28geW91ciBjbGFp
bSBpcyBtYWpvcml0eSBvZiBndWVzdHMgYXJlIGRlcGxveWVkIHcvbyBhbnkgY29sZC1wbHVnZ2Vk
Cj4+IG1lbW9yeT8KPj4KPj4gU29ycnkgZm9yIG5vdCBiZWluZyBjbGVhci4gSSB3YXMgbWVyZWx5
IHNheWluZyB0aGF0IGR5bmFtaWMgb25lIGNhbid0IGJlCj4+IG9wdGlvbmFsLCBhbmQgc3RhdGlj
IG9uZSBjYW4uIFNvIGhvdyBhYm91dCB3ZSBzdGFydCBqdXN0IHdpdGggdGhlIGR5bmFtaWMKPj4g
b25lLCB0aGVuIGFkZCB0aGUgc3RhdGljIG9uZSBhcyBhIGxhdGVyIG9wdGltaXphdGlvbj8KPiBT
aW5jZSB3ZSBoYXZlIHRoZSB1c2UgY2FzZSAoY29sZCBwbHVnZ2VkIG1lbW9yeSB0byBndWVzdCwg
ZS5nLiB3aGVuIHBvcHVsYXRlZCB3LyBodWdlcGFnZXMpIEkgdGhpbmsgd2Ugc2hvdWxkIHN0YXJ0
IHcvIGJvdGguIFRoZSBzdGF0aWMgb25lIGNhbiBiZSBvcHRpb25hbCBmb3IgZHJpdmVycy4KPgo+
IE1vcmVvdmVyIGFtIG5vdCB5ZXQgY2xlYXIgYWJvdXQgdGhlIHN1Z2dlc3RlZCBBUEkgZm9yIGR5
bmFtaWMsIGNhbiB5b3Ugc2hhcmUgdGhlIHByb3RvdHlwZSB5b3UgaGF2ZSBpbiBtaW5kPwo+IEFs
c28gd2lsbCBpdCBiZSA6Cj4gMS4gbXVsdGlwbGUgYWRkX21hcCBhbmQgdGhlbiBmbGFnIHRoZSBk
cml2ZXIgdG8gc2V0Cj4gT3IKPiAyLiBlYWNoIGFkZF9tYXAgc2hvdWxkIGJlIHNldCBieSB0aGUg
ZHJpdmVyIGFzIHN0YW5kIGFsb25lLgoKCkZvciBkeW5hbWljIG9uZSwgaXQgbG9va3MgdG8gbWUg
dGhhdCBpbnRyb2R1Y2luZyBhZGRfbWFwKCkvZGVsX21hcCgpIGJ1cyAKb3BlcmF0aW9ucyBpcyBt
dWNoIG1vcmUgY2xlYW5lciB0aGFuIHJldXNpbmcgY3VycmVudCBzZXRfbWFwKCkgb25lLgoKVGhh
bmtzCgoKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
