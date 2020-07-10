Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E160D21AFA4
	for <lists.virtualization@lfdr.de>; Fri, 10 Jul 2020 08:44:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 62348864E0;
	Fri, 10 Jul 2020 06:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x63kvDxRzQs4; Fri, 10 Jul 2020 06:44:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EBB0E864B2;
	Fri, 10 Jul 2020 06:44:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CAE8EC016F;
	Fri, 10 Jul 2020 06:44:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0820C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 06:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9F6F4887D3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 06:44:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FvEFp4NeVxyj
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 06:44:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2C51788715
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 06:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594363460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MzGyARVdJCOFDOhVSOMVsmLn0aigNSts0XTYJa817V4=;
 b=hQSMVrxV4Z5J0f46mxyjP12jnKmjSne9X/nLknBIIxGl20bIyvnzLjcqf2Q8uLthnBbp1i
 yWOTjn10QfBy01Cjq8+E/y8Gt+n0RJvhWRBOoPVziFP3YttAvM2GhwSSNWKNgy1AiLTjRE
 /+LPcOiSXofrYgjvRaG+q+OHmxSpLPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-KQOJWU4-NHmNmPCiOqvlnQ-1; Fri, 10 Jul 2020 02:44:16 -0400
X-MC-Unique: KQOJWU4-NHmNmPCiOqvlnQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5459B8015CB;
 Fri, 10 Jul 2020 06:44:15 +0000 (UTC)
Received: from [10.72.13.228] (ovpn-13-228.pek2.redhat.com [10.72.13.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 167F419D7D;
 Fri, 10 Jul 2020 06:44:09 +0000 (UTC)
Subject: Re: [PATCH RFC v8 02/11] vhost: use batched get_vq_desc version
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <CAJaqyWdwgy0fmReOgLfL4dAv-E+5k_7z3d9M+vHqt0aO2SmOFg@mail.gmail.com>
 <20200622114622-mutt-send-email-mst@kernel.org>
 <CAJaqyWfrf94Gc-DMaXO+f=xC8eD3DVCD9i+x1dOm5W2vUwOcGQ@mail.gmail.com>
 <20200622122546-mutt-send-email-mst@kernel.org>
 <CAJaqyWfbouY4kEXkc6sYsbdCAEk0UNsS5xjqEdHTD7bcTn40Ow@mail.gmail.com>
 <CAJaqyWefMHPguj8ZGCuccTn0uyKxF9ZTEi2ASLtDSjGNb1Vwsg@mail.gmail.com>
 <419cc689-adae-7ba4-fe22-577b3986688c@redhat.com>
 <CAJaqyWedEg9TBkH1MxGP1AecYHD-e-=ugJ6XUN+CWb=rQGf49g@mail.gmail.com>
 <0a83aa03-8e3c-1271-82f5-4c07931edea3@redhat.com>
 <CAJaqyWeqF-KjFnXDWXJ2M3Hw3eQeCEE2-7p1KMLmMetMTm22DQ@mail.gmail.com>
 <20200709133438-mutt-send-email-mst@kernel.org>
 <7dec8cc2-152c-83f4-aa45-8ef9c6aca56d@redhat.com>
 <CAJaqyWdLOH2EceTUduKYXCQUUNo1XQ1tLgjYHTBGhtdhBPHn_Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6282b6d5-4d2b-a996-c090-6bc7ae6043ce@redhat.com>
Date: Fri, 10 Jul 2020 14:44:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJaqyWdLOH2EceTUduKYXCQUUNo1XQ1tLgjYHTBGhtdhBPHn_Q@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: kvm list <kvm@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, netdev@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
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

Ck9uIDIwMjAvNy8xMCDkuIvljYgxOjM5LCBFdWdlbmlvIFBlcmV6IE1hcnRpbiB3cm90ZToKPiBJ
dCBpcyBhbGxvY2F0ZWQgMSB0aHJlYWQgaW4gbGNvcmUgMSAoRl9USFJFQUQ9MSkgd2hpY2ggYmVs
b25ncyB0byB0aGUKPiBzYW1lIE5VTUEgYXMgdGVzdHBtZC4gQWN0dWFsbHksIGl0IGlzIHRoZSB0
ZXN0cG1kIG1hc3RlciBjb3JlLCBzbyBpdAo+IHNob3VsZCBiZSBhIGdvb2QgaWRlYSB0byBtb3Zl
IGl0IHRvIGFub3RoZXIgbGNvcmUgb2YgdGhlIHNhbWUgTlVNQQo+IG5vZGUuCj4KPiBJcyB0aGlz
IGVub3VnaCBmb3IgcGt0Z2VuIHRvIGFsbG9jYXRlIHRoZSBtZW1vcnkgaW4gdGhhdCBudW1hIG5v
ZGU/Cj4gU2luY2UgdGhlIHNjcmlwdCBvbmx5IHdyaXRlIHBhcmFtZXRlcnMgdG8gL3Byb2MsIEkg
YXNzdW1lIHRoYXQgaXQgaGFzCj4gbm8gZWZmZWN0IHRvIHJ1biBpdCB1bmRlciBudW1hY3RsL3Rh
c2tzZXQsIGFuZCBwa3RnZW4gd2lsbCBhbGxvY2F0ZQo+IG1lbW9yeSBiYXNlZCBvbiB0aGUgbGNv
cmUgaXMgcnVubmluZy4gQW0gSSByaWdodD8KPgo+IFRoYW5rcyEKPgoKSSB0aGluayB5b3UncmUg
cmlnaHQuCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
