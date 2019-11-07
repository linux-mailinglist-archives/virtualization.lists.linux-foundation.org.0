Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 52958F2674
	for <lists.virtualization@lfdr.de>; Thu,  7 Nov 2019 05:16:35 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6AECEB7A;
	Thu,  7 Nov 2019 04:16:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4E694B7A
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 04:16:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 25919756
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 04:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573100185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=k3IbSyGD4qLkNAVSZEuvxBFa8ZkDMuEWAdZpi7gSPzg=;
	b=Do3Igs2tvwS8OTK8hbB7u4ZsqRcVAkIVIUg14UFpmEe4B+9+JqeyLJxNAC1Nw1+YzDeDlC
	fyCofOhZlkeDIGBo0xlhAC9tu+ECYZ235RWfm3U651u2soB6+FL+y6wYAcUU9EL9+bBR/4
	LC7dukr1sDz0p+VtiwMPTnGGZVF84UM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-341-MQBzENQcOFypmSyLPrCApQ-1; Wed, 06 Nov 2019 23:16:17 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3470800C61;
	Thu,  7 Nov 2019 04:16:15 +0000 (UTC)
Received: from [10.72.12.214] (ovpn-12-214.pek2.redhat.com [10.72.12.214])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 54F865D6B7;
	Thu,  7 Nov 2019 04:16:03 +0000 (UTC)
Subject: Re: [PATCH v5] vhost: introduce mdev based hardware backend
To: Tiwei Bie <tiwei.bie@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20191105115332.11026-1-tiwei.bie@intel.com>
	<20191106075733-mutt-send-email-mst@kernel.org>
	<20191106143907.GA10776@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <def13888-c99f-5f59-647b-05a4bb2f8657@redhat.com>
Date: Thu, 7 Nov 2019 12:16:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191106143907.GA10776@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: MQBzENQcOFypmSyLPrCApQ-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, maxime.coquelin@redhat.com,
	virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, lingshan.zhu@intel.com,
	linux-kernel@vger.kernel.org
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

Ck9uIDIwMTkvMTEvNiDkuIvljYgxMDozOSwgVGl3ZWkgQmllIHdyb3RlOgo+IE9uIFdlZCwgTm92
IDA2LCAyMDE5IGF0IDA3OjU5OjAyQU0gLTA1MDAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToK
Pj4gT24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMDc6NTM6MzJQTSArMDgwMCwgVGl3ZWkgQmllIHdy
b3RlOgo+Pj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbWRldiBiYXNlZCBoYXJkd2FyZSB2aG9z
dCBiYWNrZW5kLgo+Pj4gVGhpcyBiYWNrZW5kIGlzIGJ1aWx0IG9uIHRvcCBvZiB0aGUgc2FtZSBh
YnN0cmFjdGlvbiB1c2VkCj4+PiBpbiB2aXJ0aW8tbWRldiBhbmQgcHJvdmlkZXMgYSBnZW5lcmlj
IHZob3N0IGludGVyZmFjZSBmb3IKPj4+IHVzZXJzcGFjZSB0byBhY2NlbGVyYXRlIHRoZSB2aXJ0
aW8gZGV2aWNlcyBpbiBndWVzdC4KPj4+Cj4+PiBUaGlzIGJhY2tlbmQgaXMgaW1wbGVtZW50ZWQg
YXMgYSBtZGV2IGRldmljZSBkcml2ZXIgb24gdG9wCj4+PiBvZiB0aGUgc2FtZSBtZGV2IGRldmlj
ZSBvcHMgdXNlZCBpbiB2aXJ0aW8tbWRldiBidXQgdXNpbmcKPj4+IGEgZGlmZmVyZW50IG1kZXYg
Y2xhc3MgaWQsIGFuZCBpdCB3aWxsIHJlZ2lzdGVyIHRoZSBkZXZpY2UKPj4+IGFzIGEgVkZJTyBk
ZXZpY2UgZm9yIHVzZXJzcGFjZSB0byB1c2UuIFVzZXJzcGFjZSBjYW4gc2V0dXAKPj4+IHRoZSBJ
T01NVSB3aXRoIHRoZSBleGlzdGluZyBWRklPIGNvbnRhaW5lci9ncm91cCBBUElzIGFuZAo+Pj4g
dGhlbiBnZXQgdGhlIGRldmljZSBmZCB3aXRoIHRoZSBkZXZpY2UgbmFtZS4gQWZ0ZXIgZ2V0dGlu
Zwo+Pj4gdGhlIGRldmljZSBmZCwgdXNlcnNwYWNlIGNhbiB1c2Ugdmhvc3QgaW9jdGxzIG9uIHRv
cCBvZiBpdAo+Pj4gdG8gc2V0dXAgdGhlIGJhY2tlbmQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTog
VGl3ZWkgQmllIDx0aXdlaS5iaWVAaW50ZWwuY29tPgo+PiBTbyBhdCB0aGlzIHBvaW50LCBsb29r
cyBsaWtlIHRoZSBvbmx5IHRoaW5nIG1pc3NpbmcgaXMgSUZDLCBhbmQgdGhlbiBhbGwKPj4gdGhl
c2UgcGF0Y2hlcyBjYW4gZ28gaW4uCj4+IEJ1dCBhcyBJRkMgaXMgc3RpbGwgYmVpbmcgd29ya2Vk
IG9uIGFueXdheSwgaXQgbWFrZXMgc2Vuc2UgdG8KPj4gYWRkcmVzcyB0aGUgbWlub3IgY29tbWVu
dHMgbWFud2hpbGUgc28gd2UgZG9uJ3QgbmVlZAo+PiBwYXRjaGVzIG9uIHRvcC4KPj4gUmlnaHQ/
Cj4gWWVhaCwgb2YgY291cnNlLgo+Cj4gVGhhbmtzLAo+IFRpd2VpCgoKUGxlYXNlIHNlbmQgVjYg
YW5kIEkgd2lsbCBhY2sgdGhlcmUuCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
