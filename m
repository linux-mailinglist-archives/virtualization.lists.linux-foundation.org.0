Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD161ECA8B
	for <lists.virtualization@lfdr.de>; Wed,  3 Jun 2020 09:29:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 562C88444E;
	Wed,  3 Jun 2020 07:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F+FY5lymJbwK; Wed,  3 Jun 2020 07:29:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B850884949;
	Wed,  3 Jun 2020 07:29:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FAD2C016E;
	Wed,  3 Jun 2020 07:29:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2F44C016E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 07:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AF449844C0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 07:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4RSerkauSEt4
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 07:29:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 359618444E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 07:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591169356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XxS4hZGinRyO6v5MBswe9QYzQHzxWg+7TXgH/FRkvMM=;
 b=H314MoYoYgO64S3YlUbMwm5ddU2OmGEKx9lJpf56xTZVwCQ4DqbznPn8YCd3H9fm6tWjAi
 jJMGHSxFd7TKVffq5Y3N9LVdwWc9E8w0/MVVlEHQYGcjHYCqoyIk5Nz9aLc9BBC+O9L4xn
 ec3h8JHwHifb2DTGZrAG9eeLrw0BiFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-uTK2w6nSO0OwCHEMsepudw-1; Wed, 03 Jun 2020 03:29:14 -0400
X-MC-Unique: uTK2w6nSO0OwCHEMsepudw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00C66BFC0;
 Wed,  3 Jun 2020 07:29:13 +0000 (UTC)
Received: from [10.72.12.214] (ovpn-12-214.pek2.redhat.com [10.72.12.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4273760C47;
 Wed,  3 Jun 2020 07:29:03 +0000 (UTC)
Subject: Re: [PATCH RFC 04/13] vhost: cleanup fetch_buf return code handling
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200602130543.578420-1-mst@redhat.com>
 <20200602130543.578420-5-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7221afa5-bafd-f19b-9cfd-cc51a8d3b321@redhat.com>
Date: Wed, 3 Jun 2020 15:29:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602130543.578420-5-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNi8yIOS4i+WNiDk6MDYsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBSZXR1
cm4gY29kZSBvZiBmZXRjaF9idWYgaXMgY29uZnVzaW5nLCBzbyBjYWxsZXJzIHJlc29ydCB0bwo+
IHRyaWNrcyB0byBnZXQgdG8gc2FuZSB2YWx1ZXMuIExldCdzIHN3aXRjaCB0byBzb21ldGhpbmcg
c3RhbmRhcmQ6Cj4gMCBlbXB0eSwgPjAgbm9uLWVtcHR5LCA8MCBlcnJvci4KPgo+IFNpZ25lZC1v
ZmYtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbjxtc3RAcmVkaGF0LmNvbT4KPiAtLS0KPiAgIGRyaXZl
cnMvdmhvc3Qvdmhvc3QuYyB8IDI0ICsrKysrKysrKysrKysrKystLS0tLS0tLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgoKV2h5IG5vdCBzcXVh
c2hpbmcgdGhpcyBpbnRvIHBhdGNoIDIgb3IgMz8KClRoYW5rcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
