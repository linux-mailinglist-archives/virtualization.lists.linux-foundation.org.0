Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0082CE1702
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 11:58:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DB4F4EC8;
	Wed, 23 Oct 2019 09:58:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CFBDBEB2
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 09:58:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com
	(us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 6D58214D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 09:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571824689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=JJgYQZfotgXlLYk+1TQwpLuAuYDxrmw6K+/7q0UstaI=;
	b=DdgpCyiMqCzfHsgXaBK2FOCpFbhPHdnRnDgvuzoryKPtPNEVJTJhWrhXuXdrslUWLuVB4o
	wYmdYfHxPHafS8uxtyMTQNvddgqCHlFuFGPdJDYEqv5FDLCuMAmjoi9BHF+JBZ8vJkPk04
	quqFfTKIp0q5FKN0sg/IvhxNGfzZblk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-284-QeJcTTHPPBCURHnAdXrw0Q-1; Wed, 23 Oct 2019 05:58:08 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9756780183D;
	Wed, 23 Oct 2019 09:58:06 +0000 (UTC)
Received: from [10.72.12.79] (ovpn-12-79.pek2.redhat.com [10.72.12.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E145B5D6C8;
	Wed, 23 Oct 2019 09:58:01 +0000 (UTC)
Subject: Re: [RFC 2/2] vhost: IFC VF vdpa layer
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, mst@redhat.com,
	alex.williamson@redhat.com
References: <20191016013050.3918-1-lingshan.zhu@intel.com>
	<20191016013050.3918-3-lingshan.zhu@intel.com>
	<9495331d-3c65-6f49-dcd9-bfdb17054cf0@redhat.com>
	<f65358e9-6728-8260-74f7-176d7511e989@intel.com>
	<1cae60b6-938d-e2df-2dca-fbf545f06853@redhat.com>
	<ddf412c6-69e2-b3ca-d0c8-75de1db78ed9@linux.intel.com>
	<a16461af-8e78-6089-aad2-8af6d1b487af@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3c6c0319-7961-67ae-61d3-13771162dba7@redhat.com>
Date: Wed, 23 Oct 2019 17:58:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a16461af-8e78-6089-aad2-8af6d1b487af@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: QeJcTTHPPBCURHnAdXrw0Q-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, zhiyuan.lv@intel.com,
	jason.zeng@intel.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvMTAvMjMg5LiL5Y2INToyNCwgWmh1LCBMaW5nc2hhbiB3cm90ZToKPj4+Pj4KPj4+
Pj4KPj4+Pj4gc2V0X2NvbmZpZy9nZXRfY29uZmlnIGlzIG1pc3NpbmcuIEl0IGxvb2tzIHRvIG1l
IHRoZXkgYXJlIG5vdCAKPj4+Pj4gaGFyZCwganVzdCBpbXBsZW1lbnRpbmcgdGhlIGFjY2VzcyB0
byBkZXZfY2ZnLiBJdCdzIGtleSB0byBtYWtlIAo+Pj4+PiBrZXJuZWwgdmlydGlvIGRyaXZlciB0
byB3b3JrLgo+Pj4+Pgo+Pj4+PiBBbmQgaW4gdGhlIG5ldyB2ZXJzaW9uIG9mIHZpcml0by1tZGV2
LCBmZWF0dXJlcyBsaWtlIF9GX0xPR19BTEwgCj4+Pj4+IHNob3VsZCBiZSBhZHZlcnRpc2VkIHRo
cm91Z2ggZ2V0X21kZXZfZmVhdHVyZXMuCj4+Pj4gSU1ITywgY3VycmVudGx5IHRoZSBkcml2ZXIg
Y2FuIHdvcmsgd2l0aG91dCBzZXQvZ2V0X2NvbmZpZywgCj4+Pj4gdmhvc3RfbWRldiBkb2Vzbid0
IGNhbGwgdGhlbSBmb3Igbm93Lgo+Pj4KPj4+Cj4+PiBZZXMsIGJ1dCBpdCB3YXMgcmVxdWlyZWQg
YnkgdmlydGlvX21kZXYgZm9yIGhvc3QgZHJpdmVyIHRvIHdvcmssIGFuZCAKPj4+IGl0IGxvb2tz
IHRvIG1lIGl0J3Mgbm90IGhhcmQgdG8gYWRkIHRoZW0uIElmIHBvc3NpYmxlIHBsZWFzZSBhZGQg
Cj4+PiB0aGVtIGFuZCAidmlydGlvIiB0eXBlIHRoZW4gd2UgY2FuIHVzZSB0aGUgb3BzIGZvciBi
b3RoIHRoZSBjYXNlIG9mIAo+Pj4gVk0gYW5kIGNvbnRhaW5lcnMuCj4+IHN1cmUKPgo+IEhlbGxv
IEphc29uLAo+Cj4gSnVzdCB3YW50IHRvIGRvdWJsZSBjb25maXJtIHRoZSBpbXBsZW1lbnRhdGlv
biBvZiBzZXQvZ2V0X2NvbmZpZywgZm9yIAo+IG5vdywgZGV2X2NmZyBvbmx5IGNvbnRhaW5zIG1h
Y1s2XSwgc3RhdHVzIGFuZCBtYXhfdmlydHF1ZXVlX3BhaXJzLCBpcyAKPiB0aGF0IGVub3VnaCB0
byBzdXBwb3J0IHZpcnRpb19tZGV2Pwo+Cj4gVEhhbmtzIQoKClllcywgYW5kIGl0IGRlcGVuZHMg
b24gdGhlIGZlYXR1cmVzIHRoYXQgeW91IHdhbnQgdG8gYWR2ZXJ0aXNlLiBJZiB5b3UgCmRvbid0
IHdhbnQgdG8gYWR2ZXJ0aXNlIE1RLCB0aGVyZSdzIG5vIG5lZWQgdG8gZXhwb3NlIG1heF92aXJ0
cXVldWVfcGFpcnMuCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
