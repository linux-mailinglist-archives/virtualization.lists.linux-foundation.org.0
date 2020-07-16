Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EDB221FC4
	for <lists.virtualization@lfdr.de>; Thu, 16 Jul 2020 11:35:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 427F3220D0;
	Thu, 16 Jul 2020 09:35:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QxV7KBDyfOsL; Thu, 16 Jul 2020 09:35:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 35CA22264C;
	Thu, 16 Jul 2020 09:35:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1AD77C0733;
	Thu, 16 Jul 2020 09:35:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3C2FC0733
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 09:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A264288E9D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 09:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c5F6w7196Xg7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 09:35:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 25FA688E99
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 09:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594892128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IJFxd0jLmfzMQe2B9WNqDr2oh3ke3LZeNfHLfAyP12M=;
 b=GUhBxw2vRL2Z+4We+cSaCMrX/v9hdcRP1xCMr2AdxpuRnCFcQFLad88h/oWFt2lx+4JOQG
 3auNCuanSWzek3IxzGAMA4hKZfwHRjixH9Jo0h81e+eOnDKr2zG8dr+6BLBjDlNVN024iP
 tEOUupTcYQoLZJ2U+lQ8xXh4Dl9IY9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-OiUrh0QhPKywNJPooNFGRQ-1; Thu, 16 Jul 2020 05:35:26 -0400
X-MC-Unique: OiUrh0QhPKywNJPooNFGRQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F25961005269;
 Thu, 16 Jul 2020 09:35:24 +0000 (UTC)
Received: from [10.72.12.131] (ovpn-12-131.pek2.redhat.com [10.72.12.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DACCD5D9DC;
 Thu, 16 Jul 2020 09:35:19 +0000 (UTC)
Subject: Re: [PATCH vhost next 06/10] vdpa: Add means to communicate vq status
 on get_vq_state
To: Eli Cohen <eli@mellanox.com>
References: <20200716072327.5359-1-eli@mellanox.com>
 <20200716072327.5359-7-eli@mellanox.com>
 <cb9bced7-1a7e-150a-875c-1b75f77ee853@redhat.com>
 <20200716082116.GA182860@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <296e6fcb-946c-f577-2e22-46528f78fda9@redhat.com>
Date: Thu, 16 Jul 2020 17:35:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716082116.GA182860@mtl-vdi-166.wap.labs.mlnx>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Ck9uIDIwMjAvNy8xNiDkuIvljYg0OjIxLCBFbGkgQ29oZW4gd3JvdGU6Cj4gT24gVGh1LCBKdWwg
MTYsIDIwMjAgYXQgMDQ6MTE6MDBQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4gT24gMjAy
MC83LzE2IOS4i+WNiDM6MjMsIEVsaSBDb2hlbiB3cm90ZToKPj4+IEN1cnJlbnRseSwgZ2V0X3Zx
X3N0YXRlKCkgaXMgdXNlZCBvbmx5IHRvIHBhc3MgdGhlIGF2YWlsYWJsZSBpbmRleCB2YWx1ZQo+
Pj4gb2YgYSB2cS4gRXh0ZW5kIHRoZSBzdHJ1Y3QgdG8gcmV0dXJuIHN0YXR1cyBvbiB0aGUgVlEg
dG8gdGhlIGNhbGxlci4KPj4+IEZvciBub3csIGRlZmluZSBWUV9TVEFURV9OT1RfUkVBRFkuIElu
IHRoZSBmdXR1cmUgaXQgd2lsbCBiZSBleHRlbmRlZCB0bwo+Pj4gaW5jbHVkZSBvdGhlciBpbmZv
bXJhdGlvbi4KPj4+Cj4+PiBNb2RpZnkgY3VycmVudCB2ZHBhIGRyaXZlciB0byB1cGRhdGUgdGhp
cyBmaWVsZC4KPj4+Cj4+PiBSZXZpZXdlZC1ieTogUGFyYXYgUGFuZGl0PHBhcmF2QG1lbGxhbm94
LmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IEVsaSBDb2hlbjxlbGlAbWVsbGFub3guY29tPgo+PiBX
aGF0J3MgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGlzIGFuZCBnZXRfdnFfcmVhZHkoKT8KPj4K
Pj4gVGhhbmtzCj4+Cj4gVGhlcmUgaXMgbm8gZGlmZmVyZW5jZS4gSXQgaXMganVzdCBhIHdheSB0
byBjb21tdW5pY2F0ZSBhIHByb2JsZW0gdG8KPiB3aXRoIHRoZSBzdGF0ZSBvZiB0aGUgVlEgYmFj
ayB0byB0aGUgY2FsbGVyLiBUaGlzIGlzIG5vdCBhdmFpbGFibGUgbm93Lgo+IEkgdGhpbmsgYW4g
YXN5bmNocm9ub3VzIGlzIHByZWZlcnJlZCBidXQgdGhhdCBpcyBub3QgYXZhaWxhYmxlCj4gY3Vy
cmVudGx5LgoKCkkgc3RpbGwgZG9uJ3Qgc2VlIHRoZSByZWFzb24sIG1heWJlIHlvdSBjYW4gZ2l2
ZSBtZSBhbiBleGFtcGxlPwoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRp
b25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
