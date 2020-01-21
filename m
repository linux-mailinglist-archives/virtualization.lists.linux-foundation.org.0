Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FE214361B
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 05:01:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 71055204A5;
	Tue, 21 Jan 2020 04:01:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 38jHMlBcXkd6; Tue, 21 Jan 2020 04:01:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BE5C120428;
	Tue, 21 Jan 2020 04:01:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96453C0174;
	Tue, 21 Jan 2020 04:01:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1BFFC0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 04:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A84F785C90
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 04:01:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CbpZwydZdBPa
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 04:01:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 93B1A81FB4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 04:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579579283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0WT8Dbo3sKexQYJiDHR6PfmDQ2T2bkeXH3HUb+VfaA4=;
 b=hOIkeJgiMW6l9w8xoorqDXrUjlfTzSYUEbnRmN6ccbH/mkM31gXbCyBPB8ZAEpgHd1+Ohx
 YweAHYg+zbWD9Sa2OKnGgkRzI+tK6O94Hp3rMwis5IsFiyWNprn62iOp4XCd/B5yUBGugI
 lSoG8jEtpR0Tmlrs/XrwXLDNTlZcLmQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-s5fqSIo-McyvyGrkMjC0hg-1; Mon, 20 Jan 2020 23:01:20 -0500
X-MC-Unique: s5fqSIo-McyvyGrkMjC0hg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B76351034B48;
 Tue, 21 Jan 2020 04:01:17 +0000 (UTC)
Received: from [10.72.12.208] (ovpn-12-208.pek2.redhat.com [10.72.12.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9815919C58;
 Tue, 21 Jan 2020 04:00:58 +0000 (UTC)
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200117070324-mutt-send-email-mst@kernel.org>
 <239b042c-2d9e-0eec-a1ef-b03b7e2c5419@redhat.com>
 <CAJPjb1+fG9L3=iKbV4Vn13VwaeDZZdcfBPvarogF_Nzhk+FnKg@mail.gmail.com>
 <AM0PR0502MB379553984D0D55FDE25426F6C3330@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <d69918ca-8af4-44b2-9652-633530d4c113@redhat.com>
 <20200120174933.GB3891@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2a324cec-2863-58f4-c58a-2414ee32c930@redhat.com>
Date: Tue, 21 Jan 2020 12:00:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200120174933.GB3891@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Rob Miller <rob.miller@broadcom.com>, "lulu@redhat.com" <lulu@redhat.com>,
 "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>, "Wang, Xiao W" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 Netdev <netdev@vger.kernel.org>, "Zhu, Lingshan" <lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvMS8yMSDkuIrljYgxOjQ5LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gTW9u
LCBKYW4gMjAsIDIwMjAgYXQgMDQ6NDM6NTNQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4g
VGhpcyBpcyBzaW1pbGFyIHRvIHRoZSBkZXNpZ24gb2YgcGxhdGZvcm0gSU9NTVUgcGFydCBvZiB2
aG9zdC12ZHBhLiBXZQo+PiBkZWNpZGUgdG8gc2VuZCBkaWZmcyB0byBwbGF0Zm9ybSBJT01NVSB0
aGVyZS4gSWYgaXQncyBvayB0byBkbyB0aGF0IGluCj4+IGRyaXZlciwgd2UgY2FuIHJlcGxhY2Ug
c2V0X21hcCB3aXRoIGluY3JlbWVudGFsIEFQSSBsaWtlIG1hcCgpL3VubWFwKCkuCj4+Cj4+IFRo
ZW4gZHJpdmVyIG5lZWQgdG8gbWFpbnRhaW4gcmJ0cmVlIGl0c2VsZi4KPiBJIHRoaW5rIHdlIHJl
YWxseSBuZWVkIHRvIHNlZSB0d28gbW9kZXMsIG9uZSB3aGVyZSB0aGVyZSBpcyBhIGZpeGVkCj4g
dHJhbnNsYXRpb24gd2l0aG91dCBkeW5hbWljIHZJT01NVSBkcml2ZW4gY2hhbmdlcyBhbmQgb25l
IHRoYXQKPiBzdXBwb3J0cyB2SU9NTVUuCgoKSSB0aGluayBpbiB0aGlzIGNhc2UsIHlvdSBtZWFu
dCB0aGUgbWV0aG9kIHByb3Bvc2VkIGJ5IFNoYWhhZiB0aGF0IHNlbmRzIApkaWZmcyBvZiAiZml4
ZWQgdHJhbnNsYXRpb24iIHRvIGRldmljZT8KCkl0IHdvdWxkIGJlIGtpbmQgb2YgdHJpY2t5IHRv
IGRlYWwgd2l0aCB0aGUgZm9sbG93aW5nIGNhc2UgZm9yIGV4YW1wbGU6CgpvbGQgbWFwIFs0Rywg
MTZHKSBuZXcgbWFwIFs0RywgOEcpCgpJZiB3ZSBkbwoKMSkgZmx1c2ggWzRHLCAxNkcpCjIpIGFk
ZCBbNEcsIDhHKQoKVGhlcmUgY291bGQgYmUgYSB3aW5kb3cgYmV0d2VlbiAxKSBhbmQgMikuCgpJ
dCByZXF1aXJlcyB0aGUgSU9NTVUgdGhhdCBjYW4gZG8KCjEpIHJlbW92ZSBbOEcsIDE2RykKMikg
Zmx1c2ggWzhHLCAxNkcpCjMpIGNoYW5nZSBbNEcsIDhHKQoKLi4uLgoKPgo+IFRoZXJlIGFyZSBk
aWZmZXJlbnQgb3B0aW1pemF0aW9uIGdvYWxzIGluIHRoZSBkcml2ZXJzIGZvciB0aGVzZSB0d28K
PiBjb25maWd1cmF0aW9ucy4KPgo+Pj4gSWYgdGhlIGZpcnN0IG9uZSwgdGhlbiBJIHRoaW5rIG1l
bW9yeSBob3RwbHVnIGlzIGEgaGVhdnkgZmxvdwo+Pj4gcmVnYXJkbGVzcy4gRG8geW91IHRoaW5r
IHRoZSBleHRyYSBjeWNsZXMgZm9yIHRoZSB0cmVlIHRyYXZlcnNlCj4+PiB3aWxsIGJlIHZpc2li
bGUgaW4gYW55IHdheT8KPj4gSSB0aGluayBpZiB0aGUgZHJpdmVyIGNhbiBwYXVzZSB0aGUgRE1B
IGR1cmluZyB0aGUgdGltZSBmb3Igc2V0dGluZyB1cCBuZXcKPj4gbWFwcGluZywgaXQgc2hvdWxk
IGJlIGZpbmUuCj4gVGhpcyBpcyB2ZXJ5IHRyaWNreSBmb3IgYW55IGRyaXZlciBpZiB0aGUgbWFw
cGluZyBjaGFuZ2UgaGl0cyB0aGUKPiB2aXJ0aW8gcmluZ3MuIDooCj4KPiBFdmVuIGEgSU9NTVUg
dXNpbmcgZHJpdmVyIGlzIGdvaW5nIHRvIGhhdmUgcHJvYmxlbXMgd2l0aCB0aGF0Li4KPgo+IEph
c29uCgoKT3IgSSB3b25kZXIgd2hldGhlciBBVFMvUFJJIGNhbiBoZWxwIGhlcmUuIEUuZyBkdXJp
bmcgSS9PIHBhZ2UgZmF1bHQsIApkcml2ZXIvZGV2aWNlIGNhbiB3YWl0IGZvciB0aGUgbmV3IG1h
cHBpbmcgdG8gYmUgc2V0IGFuZCB0aGVuIHJlcGxheSB0aGUgCkRNQS4KClRoYW5rcwoKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
