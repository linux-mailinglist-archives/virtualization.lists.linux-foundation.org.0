Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D6361F2C07
	for <lists.virtualization@lfdr.de>; Thu,  7 Nov 2019 11:19:46 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8E3B1FBA;
	Thu,  7 Nov 2019 10:19:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 57A02D7D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 10:19:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
	[207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 32A1087D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 10:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573121977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=QVyZz1ahjF7M+iWo4uedK2mFPa9wav89AuEX9XZyCnc=;
	b=CgRAboip4WK855Rao9ZseKA8SAPZan4Jq1oAfweocKOxCzf4OVESwWZPCGJxa2/FO664dF
	UXMf/bspKCU7Mh29SWxXtbebr/pHMwhkSNqT5qEELCXvZ7CaIJYILmnQz0Up0nP9gR0pYD
	6wW6kt10EaS0IQqQRrfpnvILYDwuHnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-337-Cx0drvkqM2Go8N6RKbHCzw-1; Thu, 07 Nov 2019 05:19:33 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 262F41005500;
	Thu,  7 Nov 2019 10:19:29 +0000 (UTC)
Received: from [10.72.12.214] (ovpn-12-214.pek2.redhat.com [10.72.12.214])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9DF295D6B7;
	Thu,  7 Nov 2019 10:18:47 +0000 (UTC)
Subject: Re: [PATCH V10 6/6] docs: sample driver to demonstrate how to
	implement virtio-mdev framework
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191106133531.693-1-jasowang@redhat.com>
	<20191106133531.693-7-jasowang@redhat.com>
	<20191107040700-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bd2f7796-8d88-0eb3-b55b-3ec062b186b7@redhat.com>
Date: Thu, 7 Nov 2019 18:18:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191107040700-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: Cx0drvkqM2Go8N6RKbHCzw-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
	airlied@linux.ie, joonas.lahtinen@linux.intel.com,
	heiko.carstens@de.ibm.com, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	zhenyuw@linux.intel.com, parav@mellanox.com,
	zhihong.wang@intel.com, rodrigo.vivi@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, lingshan.zhu@intel.com
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

Ck9uIDIwMTkvMTEvNyDkuIvljYg1OjA4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
V2VkLCBOb3YgMDYsIDIwMTkgYXQgMDk6MzU6MzFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gVGhpcyBzYW1wbGUgZHJpdmVyIGNyZWF0ZXMgbWRldiBkZXZpY2UgdGhhdCBzaW11bGF0ZSB2
aXJ0aW8gbmV0IGRldmljZQo+PiBvdmVyIHZpcnRpbyBtZGV2IHRyYW5zcG9ydC4gVGhlIGRldmlj
ZSBpcyBpbXBsZW1lbnRlZCB0aHJvdWdoIHZyaW5naAo+PiBhbmQgd29ya3F1ZXVlLiBBIGRldmlj
ZSBzcGVjaWZpYyBkbWEgb3BzIGlzIHRvIG1ha2Ugc3VyZSBIVkEgaXMgdXNlZAo+PiBkaXJlY3Rs
eSBhcyB0aGUgSU9WQS4gVGhpcyBzaG91bGQgYmUgc3VmZmljaWVudCBmb3Iga2VybmVsIHZpcnRp
bwo+PiBkcml2ZXIgdG8gd29yay4KPj4KPj4gT25seSAndmlydGlvJyB0eXBlIGlzIHN1cHBvcnRl
ZCByaWdodCBub3cuIEkgcGxhbiB0byBhZGQgJ3Zob3N0JyB0eXBlCj4+IG9uIHRvcCB3aGljaCBy
ZXF1aXJlcyBzb21lIHZpcnR1YWwgSU9NTVUgaW1wbGVtZW50ZWQgaW4gdGhpcyBzYW1wbGUKPj4g
ZHJpdmVyLgo+Pgo+PiBBY2tlZC1ieTogQ29ybmVsaWEgSHVjazxjb2h1Y2tAcmVkaGF0LmNvbT4K
Pj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZzxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+IEknZCBw
cmVmZXIgaXQgdGhhdCB3ZSBjYWxsIHRoaXMgc29tZXRoaW5nIGVsc2UsIGUuZy4KPiBtdm5ldC1s
b29wYmFjay4gSnVzdCBzbyBwZW9wbGUgZG9uJ3QgZXhwZWN0IGEgZnVsbHkKPiBmdW5jdGlvbmFs
IGRldmljZSBzb21laG93LiBDYW4gYmUgcmVuYW1lZCB3aGVuIGFwcGx5aW5nPwoKCkFjdHVhbGx5
LCBJIHBsYW4gdG8gZXh0ZW5kIGl0IGFzIGFub3RoZXIgc3RhbmRhcmQgbmV0d29yayBpbnRlcmZh
Y2UgZm9yIAprZXJuZWwuIEl0IGNvdWxkIGJlIGVpdGhlciBhIHN0YW5kYWxvbmUgcHNldWRvIGRl
dmljZSBvciBhIHN0YWNrIGRldmljZS4gCkRvZXMgdGhpcyBzb3VuZHMgZ29vZCB0byB5b3U/CgpU
aGFua3MKCgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
