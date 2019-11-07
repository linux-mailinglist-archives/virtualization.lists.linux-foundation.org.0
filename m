Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D502EF2E6B
	for <lists.virtualization@lfdr.de>; Thu,  7 Nov 2019 13:47:54 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 87401151B;
	Thu,  7 Nov 2019 12:47:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C26EC10B6
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 12:47:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 460AD8AC
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573130865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=6JCLnR+p53kKswMpd/tgwGKk8bAUuYcLBcEADrD2khI=;
	b=E51YJRImZoO5KdTnQdkGPvewmD6/lQROvydi4FLYiMvSro0UJHPQAWEiEB3Y+X+jAx9d9P
	l9f794kS8ApvRgjbgItwlamcaX80BcnimBfjccfTp0tpXkN8f3I0WDPdc77cV+Fc9FRWt/
	LMc9jeWxHVOppltrQ8B9bFDGfvruDHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-178-REO-JpoKPgyjT7qK3lkRcQ-1; Thu, 07 Nov 2019 07:47:41 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAA438017E0;
	Thu,  7 Nov 2019 12:47:37 +0000 (UTC)
Received: from [10.72.12.21] (ovpn-12-21.pek2.redhat.com [10.72.12.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E34295E241;
	Thu,  7 Nov 2019 12:47:08 +0000 (UTC)
Subject: Re: [PATCH V10 6/6] docs: sample driver to demonstrate how to
	implement virtio-mdev framework
From: Jason Wang <jasowang@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191106133531.693-1-jasowang@redhat.com>
	<20191106133531.693-7-jasowang@redhat.com>
	<20191107040700-mutt-send-email-mst@kernel.org>
	<bd2f7796-8d88-0eb3-b55b-3ec062b186b7@redhat.com>
	<20191107061942-mutt-send-email-mst@kernel.org>
	<d09229bc-c3e4-8d4b-c28f-565fe150ced2@redhat.com>
Message-ID: <c588c724-04da-2991-9f88-f36c0d04364a@redhat.com>
Date: Thu, 7 Nov 2019 20:47:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d09229bc-c3e4-8d4b-c28f-565fe150ced2@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: REO-JpoKPgyjT7qK3lkRcQ-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: christophe.de.dinechin@gmail.com, kvm@vger.kernel.org, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, parav@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	zhenyuw@linux.intel.com, stefanha@redhat.com,
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

Ck9uIDIwMTkvMTEvNyDkuIvljYg4OjQzLCBKYXNvbiBXYW5nIHdyb3RlOgo+Cj4gT24gMjAxOS8x
MS83IOS4i+WNiDc6MjEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4gT24gVGh1LCBOb3Yg
MDcsIDIwMTkgYXQgMDY6MTg6NDVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+IE9uIDIw
MTkvMTEvNyDkuIvljYg1OjA4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+Pj4gT24gV2Vk
LCBOb3YgMDYsIDIwMTkgYXQgMDk6MzU6MzFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+
Pj4gVGhpcyBzYW1wbGUgZHJpdmVyIGNyZWF0ZXMgbWRldiBkZXZpY2UgdGhhdCBzaW11bGF0ZSB2
aXJ0aW8gbmV0IAo+Pj4+PiBkZXZpY2UKPj4+Pj4gb3ZlciB2aXJ0aW8gbWRldiB0cmFuc3BvcnQu
IFRoZSBkZXZpY2UgaXMgaW1wbGVtZW50ZWQgdGhyb3VnaCB2cmluZ2gKPj4+Pj4gYW5kIHdvcmtx
dWV1ZS4gQSBkZXZpY2Ugc3BlY2lmaWMgZG1hIG9wcyBpcyB0byBtYWtlIHN1cmUgSFZBIGlzIHVz
ZWQKPj4+Pj4gZGlyZWN0bHkgYXMgdGhlIElPVkEuIFRoaXMgc2hvdWxkIGJlIHN1ZmZpY2llbnQg
Zm9yIGtlcm5lbCB2aXJ0aW8KPj4+Pj4gZHJpdmVyIHRvIHdvcmsuCj4+Pj4+Cj4+Pj4+IE9ubHkg
J3ZpcnRpbycgdHlwZSBpcyBzdXBwb3J0ZWQgcmlnaHQgbm93LiBJIHBsYW4gdG8gYWRkICd2aG9z
dCcgdHlwZQo+Pj4+PiBvbiB0b3Agd2hpY2ggcmVxdWlyZXMgc29tZSB2aXJ0dWFsIElPTU1VIGlt
cGxlbWVudGVkIGluIHRoaXMgc2FtcGxlCj4+Pj4+IGRyaXZlci4KPj4+Pj4KPj4+Pj4gQWNrZWQt
Ynk6IENvcm5lbGlhIEh1Y2s8Y29odWNrQHJlZGhhdC5jb20+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IEphc29uIFdhbmc8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4+PiBJJ2QgcHJlZmVyIGl0IHRoYXQg
d2UgY2FsbCB0aGlzIHNvbWV0aGluZyBlbHNlLCBlLmcuCj4+Pj4gbXZuZXQtbG9vcGJhY2suIEp1
c3Qgc28gcGVvcGxlIGRvbid0IGV4cGVjdCBhIGZ1bGx5Cj4+Pj4gZnVuY3Rpb25hbCBkZXZpY2Ug
c29tZWhvdy4gQ2FuIGJlIHJlbmFtZWQgd2hlbiBhcHBseWluZz8KPj4+IEFjdHVhbGx5LCBJIHBs
YW4gdG8gZXh0ZW5kIGl0IGFzIGFub3RoZXIgc3RhbmRhcmQgbmV0d29yayBpbnRlcmZhY2UgZm9y
Cj4+PiBrZXJuZWwuIEl0IGNvdWxkIGJlIGVpdGhlciBhIHN0YW5kYWxvbmUgcHNldWRvIGRldmlj
ZSBvciBhIHN0YWNrIAo+Pj4gZGV2aWNlLgo+Pj4gRG9lcyB0aGlzIHNvdW5kcyBnb29kIHRvIHlv
dT8KPj4+Cj4+PiBUaGFua3MKPj4gVGhhdCdzIGEgYmlnIGNoYW5nZSBpbiBhbiBpbnRlcmZhY2Ug
c28gaXQncyBhIGdvb2QgcmVhc29uCj4+IHRvIHJlbmFtZSB0aGUgZHJpdmVyIGF0IHRoYXQgcG9p
bnQgcmlnaHQ/Cj4+IE9oZXJ3aXNlIHVzZXJzIG9mIGFuIG9sZCBrZXJuZWwgd291bGQgZXhwZWN0
IGEgc3RhY2tlZCBkcml2ZXIKPj4gYW5kIGdldCBhIGxvb3BiYWNrIGluc3RlYWQuCj4+Cj4+IE9y
IGRpZCBJIG1pc3Mgc29tZXRoaW5nPwo+Cj4KPiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgaXQg
d2FzIGEgc2FtcGxlIGRyaXZlciBpbiAvZG9jLiBJdCBzaG91bGQgbm90IAo+IGJlIHVzZWQgaW4g
cHJvZHVjdGlvbiBlbnZpcm9ubWVudC4gT3RoZXJ3aXNlIHdlIG5lZWQgdG8gbW92ZSBpdCB0byAK
PiBkcml2ZXIvdmlydGlvLgo+Cj4gQnV0IGlmIHlvdSBpbnNpc3QsIEkgY2FuIHBvc3QgYSBWMTEu
Cj4KPiBUaGFua3MgCgoKT3IgbWF5YmUgaXQncyBiZXR0ZXIgdG8gcmVuYW1lIHRoZSB0eXBlIG9m
IGN1cnJlbnQgbWRldiBmcm9tICd2aXJ0aW8nIHRvIAondmlydGlvLWxvb3BiYWNrJy4gVGhlbiB3
ZSBjYW4gYWRkIG1vcmUgdHlwZXMgaW4gdGhlIGZ1dHVyZS4KClRoYW5rcwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
