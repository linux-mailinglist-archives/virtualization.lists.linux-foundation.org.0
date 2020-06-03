Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D28A1ECA4A
	for <lists.virtualization@lfdr.de>; Wed,  3 Jun 2020 09:16:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C42FF86A9E;
	Wed,  3 Jun 2020 07:16:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sJaxP-U3JL55; Wed,  3 Jun 2020 07:16:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5CDA386AA4;
	Wed,  3 Jun 2020 07:16:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3DE9CC016E;
	Wed,  3 Jun 2020 07:16:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7F32C016E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 07:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8D89E214E9
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 07:16:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uzLxo42HXGLK
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 07:16:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 18FE82010E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 07:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591168568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=exf763iaQhedfc3bldxc9coywh4msA7jsItB1rYI+1c=;
 b=VyVhfgKfM3p2WD7UrweFDWMzSQLtuWPaDPNkbbWUA4arcB3WjRCkprxmzzJF6r8ROxWe87
 x2QM/SyRGW2O/h8YVxX8XPasOCSviofp5EuaAvctApUxjwon4OMo2PhT9DxvY6eCIqJwUH
 IcUz4sivdMdUjlfhRnWgCqI4Kyb0YKI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-K5_nyCUBMC-JhoimIte_3Q-1; Wed, 03 Jun 2020 03:16:04 -0400
X-MC-Unique: K5_nyCUBMC-JhoimIte_3Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F8EB107ACCA;
 Wed,  3 Jun 2020 07:16:03 +0000 (UTC)
Received: from [10.72.12.214] (ovpn-12-214.pek2.redhat.com [10.72.12.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33F8911A9F5;
 Wed,  3 Jun 2020 07:15:55 +0000 (UTC)
Subject: Re: [PATCH RFC 02/13] vhost: use batched version by default
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200602130543.578420-1-mst@redhat.com>
 <20200602130543.578420-3-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9dc9fb1b-c9d0-7c67-8297-f8a7dcc4c79e@redhat.com>
Date: Wed, 3 Jun 2020 15:15:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602130543.578420-3-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Ck9uIDIwMjAvNi8yIOS4i+WNiDk6MDUsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBBcyB0
ZXN0aW5nIHNob3dzIG5vIHBlcmZvcm1hbmNlIGNoYW5nZSwgc3dpdGNoIHRvIHRoYXQgbm93Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBFdWdlbmlvIFDDqXJleiA8ZXBlcmV6bWFAcmVkaGF0LmNvbT4KPiBMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjAwNDAxMTgzMTE4LjgzMzQtMy1lcGVyZXpt
YUByZWRoYXQuY29tCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVk
aGF0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvdmhvc3Qvdmhvc3QuYyB8IDI1MSArLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvdmhvc3Qvdmhvc3Qu
aCB8ICAgNCAtCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjUzIGRlbGV0
aW9ucygtKQoKClNpbmNlIHdlIGRvbid0IGhhdmUgYSB3YXkgdG8gc3dpdGNoIGJhY2ssIGl0J3Mg
YmV0dGVyIHRvIHJlbW92ZSAiYnkgCmRlZmF1bHQiIGluIHRoZSB0aXRsZS4KClRoYW5rcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
