Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ADEF2BF7
	for <lists.virtualization@lfdr.de>; Thu,  7 Nov 2019 11:17:31 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F2549150D;
	Thu,  7 Nov 2019 10:17:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8AE9D10ED
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 10:17:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com
	(us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 224B587D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 10:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573121841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=JfV7Ui0H34lc92hzIDp9GSS0/7fG2fsW51TyX4HtAsI=;
	b=CfEHg1PJYo5wBamWhOPfDIxIqwFz6blp3vY/u4lgx//DVMrfYJkwa60EBdjmhDq+fTuaTr
	b5czqTM2Y3i98riOyNV67izXrxAjfwaZjdpeCr54vHYfzJhTrub1i4mK8hsk7iM6O+zjR/
	A5sjC+b9Sk2FBTGqx1PJ8w2JIQ6FIFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-328-DKf9nbPbNFy35g1M123gRg-1; Thu, 07 Nov 2019 05:17:18 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D398F800C61;
	Thu,  7 Nov 2019 10:17:16 +0000 (UTC)
Received: from [10.72.12.214] (ovpn-12-214.pek2.redhat.com [10.72.12.214])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 446925C290;
	Thu,  7 Nov 2019 10:16:49 +0000 (UTC)
Subject: Re: [PATCH v6] vhost: introduce mdev based hardware backend
To: Tiwei Bie <tiwei.bie@intel.com>, mst@redhat.com,
	alex.williamson@redhat.com, maxime.coquelin@redhat.com
References: <20191107073530.15291-1-tiwei.bie@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1b60cc37-1c85-df85-1f4d-3f9a10ecef54@redhat.com>
Date: Thu, 7 Nov 2019 18:16:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191107073530.15291-1-tiwei.bie@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: DKf9nbPbNFy35g1M123gRg-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, lingshan.zhu@intel.com
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

Ck9uIDIwMTkvMTEvNyDkuIvljYgzOjM1LCBUaXdlaSBCaWUgd3JvdGU6Cj4gVGhpcyBwYXRjaCBp
bnRyb2R1Y2VzIGEgbWRldiBiYXNlZCBoYXJkd2FyZSB2aG9zdCBiYWNrZW5kLgo+IFRoaXMgYmFj
a2VuZCBpcyBidWlsdCBvbiB0b3Agb2YgdGhlIHNhbWUgYWJzdHJhY3Rpb24gdXNlZAo+IGluIHZp
cnRpby1tZGV2IGFuZCBwcm92aWRlcyBhIGdlbmVyaWMgdmhvc3QgaW50ZXJmYWNlIGZvcgo+IHVz
ZXJzcGFjZSB0byBhY2NlbGVyYXRlIHRoZSB2aXJ0aW8gZGV2aWNlcyBpbiBndWVzdC4KPgo+IFRo
aXMgYmFja2VuZCBpcyBpbXBsZW1lbnRlZCBhcyBhIG1kZXYgZGV2aWNlIGRyaXZlciBvbiB0b3AK
PiBvZiB0aGUgc2FtZSBtZGV2IGRldmljZSBvcHMgdXNlZCBpbiB2aXJ0aW8tbWRldiBidXQgdXNp
bmcKPiBhIGRpZmZlcmVudCBtZGV2IGNsYXNzIGlkLCBhbmQgaXQgd2lsbCByZWdpc3RlciB0aGUg
ZGV2aWNlCj4gYXMgYSBWRklPIGRldmljZSBmb3IgdXNlcnNwYWNlIHRvIHVzZS4gVXNlcnNwYWNl
IGNhbiBzZXR1cAo+IHRoZSBJT01NVSB3aXRoIHRoZSBleGlzdGluZyBWRklPIGNvbnRhaW5lci9n
cm91cCBBUElzIGFuZAo+IHRoZW4gZ2V0IHRoZSBkZXZpY2UgZmQgd2l0aCB0aGUgZGV2aWNlIG5h
bWUuIEFmdGVyIGdldHRpbmcKPiB0aGUgZGV2aWNlIGZkLCB1c2Vyc3BhY2UgY2FuIHVzZSB2aG9z
dCBpb2N0bHMgb24gdG9wIG9mIGl0Cj4gdG8gc2V0dXAgdGhlIGJhY2tlbmQuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBUaXdlaSBCaWU8dGl3ZWkuYmllQGludGVsLmNvbT4KPiAtLS0KPiBUaGlzIHBhdGNo
IGRlcGVuZHMgb24gYmVsb3cgc2VyaWVzOgo+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzEx
LzYvNTM4CgoKQWNrZWQtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+CgpUaGFu
a3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
