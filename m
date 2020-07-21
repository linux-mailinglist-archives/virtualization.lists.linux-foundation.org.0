Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BF3227836
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 07:35:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 522F588884;
	Tue, 21 Jul 2020 05:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vAw8APUzWie; Tue, 21 Jul 2020 05:35:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 82F2C88880;
	Tue, 21 Jul 2020 05:35:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B554C016F;
	Tue, 21 Jul 2020 05:35:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43AE2C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 05:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3C1B1204E4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 05:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0dJMokrDF4fi
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 05:35:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 3F77E20468
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 05:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595309716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZjxOuuUV4o3h7MOrSFtriNZrlOkqkWFhvhjNDp5Ej0=;
 b=emDhVk99XuFuBdHpfbhJNXwFGgQUb+JtDg+IBLK/a6xEiZ4s4JodzPrHUKccgwYCTwX/9Z
 wTTEaLLpt04HE5EeU66bGyUccR4N0MLXC+herWp4cRGm30JJeDW+KdC507I7PGY4uxdluI
 6za8RHUB/MtWbz3EysOMysCXfEdPop0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-GDSThcsLNlyMS6kolGBV8w-1; Tue, 21 Jul 2020 01:35:12 -0400
X-MC-Unique: GDSThcsLNlyMS6kolGBV8w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 731B858;
 Tue, 21 Jul 2020 05:35:11 +0000 (UTC)
Received: from [10.72.12.202] (ovpn-12-202.pek2.redhat.com [10.72.12.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3981260BF1;
 Tue, 21 Jul 2020 05:35:04 +0000 (UTC)
Subject: Re: [PATCH V2 vhost next 05/10] vhost: Fix documentation
To: Eli Cohen <eli@mellanox.com>, mst@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20200720071416.32112-1-eli@mellanox.com>
 <20200720071416.32112-6-eli@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7c323cac-fa03-bc46-1c41-ee7d37f350cf@redhat.com>
Date: Tue, 21 Jul 2020 13:35:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720071416.32112-6-eli@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Ck9uIDIwMjAvNy8yMCDkuIvljYgzOjE0LCBFbGkgQ29oZW4gd3JvdGU6Cj4gRml4IGRvY3VtZW50
YXRpb24gdG8gbWF0Y2ggYWN0dWFsIGZ1bmN0aW9uIHByb3RvdHlwZXMuCj4KPiBSZXZpZXdlZC1i
eTogUGFyYXYgUGFuZGl0IDxwYXJhdkBtZWxsYW5veC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRWxp
IENvaGVuIDxlbGlAbWVsbGFub3guY29tPgoKCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2Fu
Z0ByZWRoYXQuY29tPgoKCj4gLS0tCj4gICBkcml2ZXJzL3Zob3N0L2lvdGxiLmMgfCA0ICsrLS0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC9pb3RsYi5jIGIvZHJpdmVycy92aG9zdC9pb3RsYi5j
Cj4gaW5kZXggMWYwY2E2ZTQ0NDEwLi4wZDQyMTNhNTRhODggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy92aG9zdC9pb3RsYi5jCj4gKysrIGIvZHJpdmVycy92aG9zdC9pb3RsYi5jCj4gQEAgLTE0OSw3
ICsxNDksNyBAQCBFWFBPUlRfU1lNQk9MX0dQTCh2aG9zdF9pb3RsYl9mcmVlKTsKPiAgICAqIHZo
b3N0X2lvdGxiX2l0cmVlX2ZpcnN0IC0gcmV0dXJuIHRoZSBmaXJzdCBvdmVybGFwcGVkIHJhbmdl
Cj4gICAgKiBAaW90bGI6IHRoZSBJT1RMQgo+ICAgICogQHN0YXJ0OiBzdGFydCBvZiBJT1ZBIHJh
bmdlCj4gLSAqIEBlbmQ6IGVuZCBvZiBJT1ZBIHJhbmdlCj4gKyAqIEBsYXN0OiBsYXN0IGJ5dGUg
aW4gSU9WQSByYW5nZQo+ICAgICovCj4gICBzdHJ1Y3Qgdmhvc3RfaW90bGJfbWFwICoKPiAgIHZo
b3N0X2lvdGxiX2l0cmVlX2ZpcnN0KHN0cnVjdCB2aG9zdF9pb3RsYiAqaW90bGIsIHU2NCBzdGFy
dCwgdTY0IGxhc3QpCj4gQEAgLTE2Miw3ICsxNjIsNyBAQCBFWFBPUlRfU1lNQk9MX0dQTCh2aG9z
dF9pb3RsYl9pdHJlZV9maXJzdCk7Cj4gICAgKiB2aG9zdF9pb3RsYl9pdHJlZV9maXJzdCAtIHJl
dHVybiB0aGUgbmV4dCBvdmVybGFwcGVkIHJhbmdlCj4gICAgKiBAaW90bGI6IHRoZSBJT1RMQgo+
ICAgICogQHN0YXJ0OiBzdGFydCBvZiBJT1ZBIHJhbmdlCj4gLSAqIEBlbmQ6IGVuZCBvZiBJT1ZB
IHJhbmdlCj4gKyAqIEBsYXN0OiBsYXN0IGJ5dGUgSU9WQSByYW5nZQo+ICAgICovCj4gICBzdHJ1
Y3Qgdmhvc3RfaW90bGJfbWFwICoKPiAgIHZob3N0X2lvdGxiX2l0cmVlX25leHQoc3RydWN0IHZo
b3N0X2lvdGxiX21hcCAqbWFwLCB1NjQgc3RhcnQsIHU2NCBsYXN0KQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
