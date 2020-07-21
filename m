Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E3822785A
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 07:52:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 50E5B24BEA;
	Tue, 21 Jul 2020 05:52:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vt7adLA-6v3k; Tue, 21 Jul 2020 05:52:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C44DB24BE6;
	Tue, 21 Jul 2020 05:52:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0D83C016F;
	Tue, 21 Jul 2020 05:52:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB9DCC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 05:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E445088B0B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 05:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7x1nUI370sOk
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 05:52:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BF15788B1F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 05:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595310724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aLjkj/NtDRd3xkfHAYuSB+hneYUy009qM+qF11a/0w8=;
 b=CUUfkrqevHLtn5YJBMPCZaYKdGDM6U2Vy/ByEcDArD6G9nK5sGPJf5/ohCXfqEVUWpmJvB
 sFcvdUt08E3/ZKxzD0eTSupMo91loNpOsr+xD0FDltOheCbIgSkdes5JkPmPUnHfolMppJ
 7ORA+SELD43PhpYsLdtsTYlGhCpVxZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-OuMNqS5uP7OfxFt7hiEfjA-1; Tue, 21 Jul 2020 01:52:02 -0400
X-MC-Unique: OuMNqS5uP7OfxFt7hiEfjA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 445A118C63C2;
 Tue, 21 Jul 2020 05:52:01 +0000 (UTC)
Received: from [10.72.12.202] (ovpn-12-202.pek2.redhat.com [10.72.12.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07D1619C66;
 Tue, 21 Jul 2020 05:51:55 +0000 (UTC)
Subject: Re: [PATCH V2 vhost next 10/10] vdpa/mlx5: Add VDPA driver for
 supported mlx5 devices
To: Eli Cohen <eli@mellanox.com>, mst@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20200720071416.32112-1-eli@mellanox.com>
 <20200720071416.32112-11-eli@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <73209efd-f513-fec2-e4f7-51e71f08c9fe@redhat.com>
Date: Tue, 21 Jul 2020 13:51:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720071416.32112-11-eli@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: shahafs@mellanox.com, parav@mellanox.com, saeedm@mellanox.com
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

Ck9uIDIwMjAvNy8yMCDkuIvljYgzOjE0LCBFbGkgQ29oZW4gd3JvdGU6Cj4gQWRkIGEgZnJvbnQg
ZW5kIFZEUEEgZHJpdmVyIHRoYXQgcmVnaXN0ZXJzIGluIHRoZSBWRFBBIGJ1cyBhbmQgcHJvdmlk
ZXMKPiBuZXR3b3JraW5nIHRvIGEgZ3Vlc3QuIFRoZSBWRFBBIGRyaXZlciBjcmVhdGVzIHRoZSBu
ZWNlc3NhcnkgcmVzb3VyY2VzCj4gb24gdGhlIFZGIGl0IGlzIGRyaXZpbmcgc3VjaCB0aGF0IGRh
dGEgcGF0aCB3aWxsIGJlIG9mZmxvYWRlZC4KPgo+IE5vdGlmaWNhdGlvbnMgYXJlIGJlaW5nIGNv
bW11bmljYXRlZCB0aHJvdWdoIHRoZSBkcml2ZXIuCj4KPiBDdXJyZW50bHksIG9ubHkgVkZzIGFy
ZSBzdXBwb3J0ZWQuIEluIHN1YnNlcXVlbnQgcGF0Y2hlcyB3ZSB3aWxsIGhhdmUKPiBkZXZsaW5r
IHN1cHBvcnQgdG8gY29udHJvbCB3aGljaCBWRiBpcyB1c2VkIGZvciBWRFBBIGFuZCB3aGljaCBm
dW5jdGlvbgo+IGlzIHVzZWQgZm9yIHJlZ3VsYXIgbmV0d29ya2luZy4KPgo+IFJldmlld2VkLWJ5
OiBQYXJhdiBQYW5kaXQ8cGFyYXZAbWVsbGFub3guY29tPgo+IFNpZ25lZC1vZmYtYnk6IEVsaSBD
b2hlbjxlbGlAbWVsbGFub3guY29tPgo+IC0tLQo+IENoYW5nZXMgZnJvbSBWMDoKPiAxLiBGaXgg
aW5jbHVkZSBwYXRoIHVzYWdlCj4gMi4gRml4IHVzZSBhZnRlciBmcmVlIGluIHFwX2NyZWF0ZSgp
Cj4gMy4gQ29uc2lzdGVudGx5IHVzZSBtdnEtPmluaXRpYWxpemVkIHRvIGNoZWNrIGlmIGEgdnEg
d2FzIGluaXRpYWxpemVkLgo+IDQuIFJlbW92ZSB1bnVzZWQgbG9jYWwgdmFyaWFibGUuCj4gNS4g
RGVmZXIgbW9kaWZ5aWcgdnEgdG8gcmVhZHkgdG8gZHJpdmVyIG9rCj4gNi4gc3VzcGVuZCBoYXJk
d2FyZSB2cSBpbiBzZXRfdnFfcmVhZHkoMCkKPiA3LiBSZW1vdmUgcmVzZXJ2YXRpb24gZm9yIGNv
bnRyb2wgVlEgc2luY2UgaXQgbXVsdGkgcXVldWUgaXMgbm90IHN1cHBvcnRlZCBpbiB0aGlzIHZl
cnNpb24KPiA4LiBBdm9pZCBjYWxsIHB1dF9kZXZpY2UoKSBzaW5jZSB0aGlzIGlzIG5vdCBhIHBj
aSBkZXZpY2UgZHJpdmVyLgoKCkxvb2tzIGdvb2QgdG8gbWUuCgpBY2tlZC1ieTogSmFzb24gV2Fu
ZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRp
b25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
