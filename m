Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D70313037DF
	for <lists.virtualization@lfdr.de>; Tue, 26 Jan 2021 09:28:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9104986483;
	Tue, 26 Jan 2021 08:28:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ha-r5RQ8jl4D; Tue, 26 Jan 2021 08:28:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 14DE386499;
	Tue, 26 Jan 2021 08:28:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E11BEC013A;
	Tue, 26 Jan 2021 08:28:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BB0CC013A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 08:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5C85D20386
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 08:28:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jDWTOAeUfliI
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 08:28:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 7CAB920101
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 08:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611649726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhV4Mq5/sBWiSQk3XJm+QtpJxWDhek1THdWB8YUzVxE=;
 b=gDVwcKsOHAPEnXI7g+VHzM/wEB6hZ3IMrTylTl5dXzr6xzfO/tI95kKzs0wz9O9P48GbNt
 9HAjX5e6xiklSk5WjkO7/DgkSCgSj5vuz8eslTZhaYmRmO6gS43HhpqhEwEZpIP7XZ6VVQ
 VYexVSihAwQdRv7ne0eEEhLKxW4vSeY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83--4Inxhf7N6asR7JiI5xpBw-1; Tue, 26 Jan 2021 03:28:44 -0500
X-MC-Unique: -4Inxhf7N6asR7JiI5xpBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFFA310054FF;
 Tue, 26 Jan 2021 08:28:42 +0000 (UTC)
Received: from [10.72.12.70] (ovpn-12-70.pek2.redhat.com [10.72.12.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B76672168;
 Tue, 26 Jan 2021 08:28:35 +0000 (UTC)
Subject: Re: [PATCH v3] vhost_vdpa: fix the problem in
 vhost_vdpa_set_config_call
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 netdev@vger.kernel.org
References: <20210126071607.31487-1-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <757a05d2-c82e-e957-1b7c-55eb64495f1b@redhat.com>
Date: Tue, 26 Jan 2021 16:28:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210126071607.31487-1-lulu@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: stable@vger.kernel.org
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

Ck9uIDIwMjEvMS8yNiDkuIvljYgzOjE2LCBDaW5keSBMdSB3cm90ZToKPiBJbiB2aG9zdF92ZHBh
X3NldF9jb25maWdfY2FsbCwgdGhlIGNiLnByaXZhdGUgc2hvdWxkIGJlIHZob3N0X3ZkcGEuCj4g
dGhpcyBjYi5wcml2YXRlIHdpbGwgZmluYWxseSB1c2UgaW4gdmhvc3RfdmRwYV9jb25maWdfY2Ig
YXMKPiB2aG9zdF92ZHBhLiBGaXggdGhpcyBpc3N1ZS4KPgo+IENjOiBzdGFibGVAdmdlci5rZXJu
ZWwub3JnCj4gRml4ZXM6IDc3NmYzOTUwMDRkODIgKCJ2aG9zdF92ZHBhOiBTdXBwb3J0IGNvbmZp
ZyBpbnRlcnJ1cHQgaW4gdmRwYSIpCj4gU2lnbmVkLW9mZi1ieTogQ2luZHkgTHUgPGx1bHVAcmVk
aGF0LmNvbT4KCgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KCgo+
IC0tLQo+ICAgZHJpdmVycy92aG9zdC92ZHBhLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zo
b3N0L3ZkcGEuYyBiL2RyaXZlcnMvdmhvc3QvdmRwYS5jCj4gaW5kZXggZWY2ODhjOGMwZTBlLi4z
ZmJiOWMxZjQ5ZGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aG9zdC92ZHBhLmMKPiArKysgYi9k
cml2ZXJzL3Zob3N0L3ZkcGEuYwo+IEBAIC0zMTksNyArMzE5LDcgQEAgc3RhdGljIGxvbmcgdmhv
c3RfdmRwYV9zZXRfY29uZmlnX2NhbGwoc3RydWN0IHZob3N0X3ZkcGEgKnYsIHUzMiBfX3VzZXIg
KmFyZ3ApCj4gICAJc3RydWN0IGV2ZW50ZmRfY3R4ICpjdHg7Cj4gICAKPiAgIAljYi5jYWxsYmFj
ayA9IHZob3N0X3ZkcGFfY29uZmlnX2NiOwo+IC0JY2IucHJpdmF0ZSA9IHYtPnZkcGE7Cj4gKwlj
Yi5wcml2YXRlID0gdjsKPiAgIAlpZiAoY29weV9mcm9tX3VzZXIoJmZkLCBhcmdwLCBzaXplb2Yo
ZmQpKSkKPiAgIAkJcmV0dXJuICAtRUZBVUxUOwo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmly
dHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
