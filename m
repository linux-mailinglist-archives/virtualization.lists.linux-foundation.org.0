Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F36FE47E3
	for <lists.virtualization@lfdr.de>; Fri, 25 Oct 2019 11:55:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8197413D1;
	Fri, 25 Oct 2019 09:55:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4FF9213C9
	for <virtualization@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 09:55:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com
	(us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id AA1DB87B
	for <virtualization@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 09:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571997315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=UVoMMueYUvZ0eI/99xRHtgd80EIwZE7u1t/HBTorxLk=;
	b=CnVy8qTu145LnR3iFmrmWvmicVVYM7v8yuXrnpCj8yZTpswO96LH0qednG4VTVnKY+rOoS
	sEaFJl89pu9UGUXu0nwdsdIYFCAOkpAqwRmxaLi5RVHjp4TXmO6qI3HbGwFNH8Lqu9/SJb
	eEtnMH6bd99zWuKsGz2oPKQN95O0+0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-42-29ZThwCIPJi-QKNlPM682w-1; Fri, 25 Oct 2019 05:55:10 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F6D91005500;
	Fri, 25 Oct 2019 09:55:09 +0000 (UTC)
Received: from [10.72.12.249] (ovpn-12-249.pek2.redhat.com [10.72.12.249])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC3E160BEC;
	Fri, 25 Oct 2019 09:54:56 +0000 (UTC)
Subject: Re: [PATCH v2] vhost: introduce mdev based hardware backend
From: Jason Wang <jasowang@redhat.com>
To: Tiwei Bie <tiwei.bie@intel.com>
References: <47a572fd-5597-1972-e177-8ee25ca51247@redhat.com>
	<20191023030253.GA15401@___>
	<ac36f1e3-b972-71ac-fe0c-3db03e016dcf@redhat.com>
	<20191023070747.GA30533@___>
	<106834b5-dae5-82b2-0f97-16951709d075@redhat.com>
	<20191023101135.GA6367@___>
	<5a7bc5da-d501-2750-90bf-545dd55f85fa@redhat.com>
	<20191024042155.GA21090@___>
	<d37529e1-5147-bbe5-cb9d-299bd6d4aa1a@redhat.com>
	<d4cc4f4e-2635-4041-2f68-cd043a97f25a@redhat.com>
	<20191024091839.GA17463@___>
	<fefc82a3-a137-bc03-e1c3-8de79b238080@redhat.com>
Message-ID: <e7e239ba-2461-4f8d-7dd7-0f557ac7f4bf@redhat.com>
Date: Fri, 25 Oct 2019 17:54:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fefc82a3-a137-bc03-e1c3-8de79b238080@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 29ZThwCIPJi-QKNlPM682w-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, maxime.coquelin@redhat.com, lingshan.zhu@intel.com
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

Ck9uIDIwMTkvMTAvMjQg5LiL5Y2INjo0MiwgSmFzb24gV2FuZyB3cm90ZToKPgo+IFllcy4KPgo+
Cj4+IMKgIEFuZCB3ZSBzaG91bGQgdHJ5IHRvIGF2b2lkCj4+IHB1dHRpbmcgY3RybCB2cSBhbmQg
UngvVHggdnFzIGluIHRoZSBzYW1lIERNQSBzcGFjZSB0byBwcmV2ZW50Cj4+IGd1ZXN0cyBoYXZp
bmcgdGhlIGNoYW5jZSB0byBieXBhc3MgdGhlIGhvc3QgKGUuZy4gUUVNVSkgdG8KPj4gc2V0dXAg
dGhlIGJhY2tlbmQgYWNjZWxlcmF0b3IgZGlyZWN0bHkuCj4KPgo+IFRoYXQncyByZWFsbHkgZ29v
ZCBwb2ludC7CoCBTbyB3aGVuICJ2aG9zdCIgdHlwZSBpcyBjcmVhdGVkLCBwYXJlbnQgCj4gc2hv
dWxkIGFzc3VtZSBhZGRyIG9mIGN0cmxfdnEgaXMgaHZhLgo+Cj4gVGhhbmtzCgoKVGhpcyB3b3Jr
cyBmb3Igdmhvc3QgYnV0IG5vdCB2aXJ0aW8gc2luY2UgdGhlcmUncyBubyB3YXkgZm9yIHZpcnRp
byAKa2VybmVsIGRyaXZlciB0byBkaWZmZXIgY3RybF92cSB3aXRoIHRoZSByZXN0IHdoZW4gZG9p
bmcgRE1BIG1hcC4gT25lIApwb3NzaWJsZSBzb2x1dGlvbiBpcyB0byBwcm92aWRlIERNQSBkb21h
aW4gaXNvbGF0aW9uIGJldHdlZW4gdmlydHF1ZXVlcy4gClRoZW4gY3RybCB2cSBjYW4gdXNlIGl0
cyBkZWRpY2F0ZWQgRE1BIGRvbWFpbiBmb3IgdGhlIHdvcmsuCgpBbnl3YXksIHRoaXMgY291bGQg
YmUgZG9uZSBpbiB0aGUgZnV0dXJlLiBXZSBjYW4gaGF2ZSBhIHZlcnNpb24gZmlyc3QgCnRoYXQg
ZG9lc24ndCBzdXBwb3J0IGN0cmxfdnEuCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
