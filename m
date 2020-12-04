Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE3F2CE5F7
	for <lists.virtualization@lfdr.de>; Fri,  4 Dec 2020 03:53:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BD8178771F;
	Fri,  4 Dec 2020 02:53:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MpwkbcFCoDhZ; Fri,  4 Dec 2020 02:53:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4A18F87708;
	Fri,  4 Dec 2020 02:53:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14ED7C0FA7;
	Fri,  4 Dec 2020 02:53:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90736C0FA7
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 02:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 74C9D8735F
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 02:53:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 261uUWfTuDnp
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 02:53:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0144186B0B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 02:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607050417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aYyPItDtofx2TMiKK9YfkgNw2PWQqyYSINgpGlu4IEI=;
 b=C1IyARkUvnpEvPqsuFGmsSUr2uISqdmBGwbxjAE0MzXcjmq/0tCvx11iz62gAatZXj+oWs
 H1WY+m0WAE2leCm5NEvusoIITiM/DwGhboq+ST+3VKi1OLtCsFcT2/sLL6Om61P+c8dEu7
 glaC5hLais7eTOoN809luv4rQpK/csQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-9UnpziFBPRC6VoqCTN-m8A-1; Thu, 03 Dec 2020 21:53:36 -0500
X-MC-Unique: 9UnpziFBPRC6VoqCTN-m8A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC12F8049C1;
 Fri,  4 Dec 2020 02:53:34 +0000 (UTC)
Received: from [10.72.12.116] (ovpn-12-116.pek2.redhat.com [10.72.12.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EBC41A4D0;
 Fri,  4 Dec 2020 02:53:29 +0000 (UTC)
Subject: Re: [PATCH] vdpa/mlx5: Use random MAC for the vdpa net instance
To: Eli Cohen <elic@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <CACLfguWDFgJUJTJik1obvv-vzacRwgkfsN=-Uouu+K9dAKFE+A@mail.gmail.com>
 <e52b94b6-42a8-1270-1e10-d1905ccae598@redhat.com>
 <20201202055714.GA224423@mtl-vdi-166.wap.labs.mlnx>
 <20201202041518-mutt-send-email-mst@kernel.org>
 <3e32ef6d-83c9-5866-30e5-f6eeacd5044d@redhat.com>
 <20201202165932-mutt-send-email-mst@kernel.org>
 <20201203064928.GA27404@mtl-vdi-166.wap.labs.mlnx>
 <20201203054330-mutt-send-email-mst@kernel.org>
 <20201203120929.GA38007@mtl-vdi-166.wap.labs.mlnx>
 <20201203071414-mutt-send-email-mst@kernel.org>
 <20201203122421.GB38007@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b74596fe-fff3-2144-b41a-b9898b6933da@redhat.com>
Date: Fri, 4 Dec 2020 10:53:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201203122421.GB38007@mtl-vdi-166.wap.labs.mlnx>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: linux-kernel@vger.kernel.org, Cindy Lu <lulu@redhat.com>,
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

Ck9uIDIwMjAvMTIvMyDkuIvljYg4OjI0LCBFbGkgQ29oZW4gd3JvdGU6Cj4+PiBJdCBpcyBtZW50
aW9uZWQgaW4gUGFyYXYncyBwYXRjaHNldCB0aGF0IHRoaXMgd2lsbCBiZSBjb21pbmcgaW4gYQo+
Pj4gc3Vic2VxdWVudCBwYXRjaCB0byBoaXMgdmRwYSB0b29sLgo+PiBTbyBJIHRoaW5rIGtlcm5l
bCBoYXMgdHdvIG9wdGlvbnM6Cj4+IC0gcmVxdWlyZSBhIG1hYyB3aGVuIGRldmljZSBpcyBjcmVh
dGVkLCB3ZSBzdXBwbHkgaXQgdG8gZ3Vlc3QKPiBZZXMsIHRoZSBkcml2ZXIgc2hvdWxkIGFsd2F5
cyBzZXQgVklSVElPX05FVF9GX01BQyBhbmQgcHJvdmlkZSBhIE1BQyAtCj4gZWl0aGVyIHJhbmRv
bSBvciB3aGF0ZXZlciBjb25maWd1cmVkIHVzaW5nIHRoZSB2ZHBhIHRvby4KCgpBIHF1ZXN0aW9u
cyBoZXJlLCBJIHRoaW5rIGN1cnJlbnQgbWx4NSB2ZHBhIHdvcmtzIGZvciBWRiBvbmx5LiBTbyBJ
IAp0aGluayB0aGUgVkYgc2hvdWxkIGhhdmUgYSBnaXZlbiBNQUM/IElmIHllcywgY2FuIHdlIHVz
ZSB0aGF0IE1BQz8KClRoYW5rcwoKCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
