Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1805622566D
	for <lists.virtualization@lfdr.de>; Mon, 20 Jul 2020 06:13:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BF51686B7B;
	Mon, 20 Jul 2020 04:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5GcAHr+vl0bf; Mon, 20 Jul 2020 04:13:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0366F86B55;
	Mon, 20 Jul 2020 04:13:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7921C016F;
	Mon, 20 Jul 2020 04:13:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C40ABC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 04:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B2DF7858F5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 04:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sUCD21NnKgOH
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 04:13:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 73431849B7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 04:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595218414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5W6bavoC2QFTavpGU5cs5NwNxhTst/1scGklkKaWEu8=;
 b=G37YrMC6hn8pbMRnjtRoAAiXxaLAnWZeX5ONKSPl0CJaPORMrAXp8gf/H7qyh3/XYXOb8i
 akEeZu9Eq1JfcIikByF/dJ8X6qLnW7B/SMEhgMTp4rSRMpvC+GkRKSgqAD1QPXfI3EY2HI
 DgZm0mFRp9r+i6qs2Hk/NBCw8BncgiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-imyCPF87OSKWeaQHXtT7jw-1; Mon, 20 Jul 2020 00:13:33 -0400
X-MC-Unique: imyCPF87OSKWeaQHXtT7jw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5D288064DD;
 Mon, 20 Jul 2020 04:13:31 +0000 (UTC)
Received: from [10.72.13.139] (ovpn-13-139.pek2.redhat.com [10.72.13.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7918A5C1B2;
 Mon, 20 Jul 2020 04:13:26 +0000 (UTC)
Subject: Re: [PATCH vhost next 06/10] vdpa: Add means to communicate vq status
 on get_vq_state
To: Eli Cohen <eli@mellanox.com>
References: <20200716072327.5359-1-eli@mellanox.com>
 <20200716072327.5359-7-eli@mellanox.com>
 <cb9bced7-1a7e-150a-875c-1b75f77ee853@redhat.com>
 <20200716082116.GA182860@mtl-vdi-166.wap.labs.mlnx>
 <296e6fcb-946c-f577-2e22-46528f78fda9@redhat.com>
 <20200716102533.GB186790@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0ed28d74-cb0c-89af-61dd-9256e8bb2328@redhat.com>
Date: Mon, 20 Jul 2020 12:13:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716102533.GB186790@mtl-vdi-166.wap.labs.mlnx>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: shahafs@mellanox.com, Parav Pandit <parav@mellanox.com>, mst@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 saeedm@mellanox.com
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

Ck9uIDIwMjAvNy8xNiDkuIvljYg2OjI1LCBFbGkgQ29oZW4gd3JvdGU6Cj4gT24gVGh1LCBKdWwg
MTYsIDIwMjAgYXQgMDU6MzU6MThQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4gT24gMjAy
MC83LzE2IOS4i+WNiDQ6MjEsIEVsaSBDb2hlbiB3cm90ZToKPj4+IE9uIFRodSwgSnVsIDE2LCAy
MDIwIGF0IDA0OjExOjAwUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+Pj4gT24gMjAyMC83
LzE2IOS4i+WNiDM6MjMsIEVsaSBDb2hlbiB3cm90ZToKPj4+Pj4gQ3VycmVudGx5LCBnZXRfdnFf
c3RhdGUoKSBpcyB1c2VkIG9ubHkgdG8gcGFzcyB0aGUgYXZhaWxhYmxlIGluZGV4IHZhbHVlCj4+
Pj4+IG9mIGEgdnEuIEV4dGVuZCB0aGUgc3RydWN0IHRvIHJldHVybiBzdGF0dXMgb24gdGhlIFZR
IHRvIHRoZSBjYWxsZXIuCj4+Pj4+IEZvciBub3csIGRlZmluZSBWUV9TVEFURV9OT1RfUkVBRFku
IEluIHRoZSBmdXR1cmUgaXQgd2lsbCBiZSBleHRlbmRlZCB0bwo+Pj4+PiBpbmNsdWRlIG90aGVy
IGluZm9tcmF0aW9uLgo+Pj4+Pgo+Pj4+PiBNb2RpZnkgY3VycmVudCB2ZHBhIGRyaXZlciB0byB1
cGRhdGUgdGhpcyBmaWVsZC4KPj4+Pj4KPj4+Pj4gUmV2aWV3ZWQtYnk6IFBhcmF2IFBhbmRpdDxw
YXJhdkBtZWxsYW5veC5jb20+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEVsaSBDb2hlbjxlbGlAbWVs
bGFub3guY29tPgo+Pj4+IFdoYXQncyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoaXMgYW5kIGdl
dF92cV9yZWFkeSgpPwo+Pj4+Cj4+Pj4gVGhhbmtzCj4+Pj4KPj4+IFRoZXJlIGlzIG5vIGRpZmZl
cmVuY2UuIEl0IGlzIGp1c3QgYSB3YXkgdG8gY29tbXVuaWNhdGUgYSBwcm9ibGVtIHRvCj4+PiB3
aXRoIHRoZSBzdGF0ZSBvZiB0aGUgVlEgYmFjayB0byB0aGUgY2FsbGVyLiBUaGlzIGlzIG5vdCBh
dmFpbGFibGUgbm93Lgo+Pj4gSSB0aGluayBhbiBhc3luY2hyb25vdXMgaXMgcHJlZmVycmVkIGJ1
dCB0aGF0IGlzIG5vdCBhdmFpbGFibGUKPj4+IGN1cnJlbnRseS4KPj4KPj4gSSBzdGlsbCBkb24n
dCBzZWUgdGhlIHJlYXNvbiwgbWF5YmUgeW91IGNhbiBnaXZlIG1lIGFuIGV4YW1wbGU/Cj4+Cj4+
Cj4gTXkgaW50ZW50aW9uIHdhcyB0byBwcm92aWRlIGEgbWVjaGFpbnNtIHRvIHJldHVybiBtZWFu
aW5nZnVsIGluZm9ybWF0aW9uCj4gb24gdGhlIHN0YXRlIG9mIHRoZSB2cS4gRm9yIGV4YW1wbGUs
IHdoZW4geW91IGZhaWwgdG8gZ2V0IHRoZSBzdGF0ZSBvZgo+IHRoZSBWUS4KPgo+IE1heWJlIEkg
Y291bGQganVzdCBjaGFuZ2UgdGhlIHByb3RvdHlwZSBvZiB0aGUgZnVuY3Rpb24gdG8gcmV0dXJu
IGludAo+IGFuZCB0aGUgZHJpdmVyIGNvdWxkIHB1dCBhbiBlcnJvciBpZiBpdCBoYXMgdHJvdWJs
ZSByZXR1cm5pbmcgdGhlIHZxCj4gc3RhdGUuCgoKVGhhdCdzIGZpbmUuCgpUaGFua3MKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlv
biBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVh
bGl6YXRpb24=
