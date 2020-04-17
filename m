Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 132C01ADA5C
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 11:48:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 948F120035;
	Fri, 17 Apr 2020 09:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZBw7v6FkhytP; Fri, 17 Apr 2020 09:48:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DCC9020364;
	Fri, 17 Apr 2020 09:48:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C494BC0172;
	Fri, 17 Apr 2020 09:48:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9D7FC0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B6B8B8786C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:48:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C1RaXwYOdySK
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:48:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7D85787629
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587116917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EH1XZETTMUkBMVwE0SvYImZx8kDPUe6xlEK01XCSGX4=;
 b=J1qgaVQ+WnGAkUAX8KTuAbi475JIT+cnvXkEtEcN4ybMl7949fkTVDRNmx6QLtP+wCQqqH
 sK6rPIpdVvgtVkT1G5uJAZO6tF+l9mpizEPS8cQtkDbwPCpZjql9abNxDGEwsPTfbFIEoB
 gVs6X2SoJ34nZbsLwH1+U36LoCt3EVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-MzTmX318NzqE3LOEWqBCMw-1; Fri, 17 Apr 2020 05:48:35 -0400
X-MC-Unique: MzTmX318NzqE3LOEWqBCMw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B26A51005509;
 Fri, 17 Apr 2020 09:48:31 +0000 (UTC)
Received: from [10.72.13.157] (ovpn-13-157.pek2.redhat.com [10.72.13.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73F3611A088;
 Fri, 17 Apr 2020 09:48:22 +0000 (UTC)
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
 <20200417022929-mutt-send-email-mst@kernel.org>
 <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
 <20200417042912-mutt-send-email-mst@kernel.org>
 <fdb555a6-4b8d-15b6-0849-3fe0e0786038@redhat.com>
 <20200417044230-mutt-send-email-mst@kernel.org>
 <73843240-3040-655d-baa9-683341ed4786@redhat.com>
 <20200417050029-mutt-send-email-mst@kernel.org>
 <ce8a18e5-3c74-73cc-57c5-10c40af838a3@redhat.com>
 <20200417053803-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <71b98c3b-1a38-b9aa-149c-f48c92a77448@redhat.com>
Date: Fri, 17 Apr 2020 17:48:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200417053803-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: linux-s390@vger.kernel.org, tsbogend@alpha.franken.de,
 benh@kernel.crashing.org, gor@linux.ibm.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, heiko.carstens@de.ibm.com,
 linux-mips@vger.kernel.org, virtualization@lists.linux-foundation.org,
 borntraeger@de.ibm.com, geert@linux-m68k.org,
 Michael Ellerman <mpe@ellerman.id.au>, netdev@vger.kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
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

Ck9uIDIwMjAvNC8xNyDkuIvljYg1OjM4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
RnJpLCBBcHIgMTcsIDIwMjAgYXQgMDU6MzM6NTZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMC80LzE3IOS4i+WNiDU6MDEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
PiBUaGVyZSBjb3VsZCBiZSBzb21lIG1pc3VuZGVyc3RhbmRpbmcgaGVyZS4gSSB0aG91Z2h0IGl0
J3Mgc29tZWhvdyBzaW1pbGFyOiBhCj4+Pj4gQ09ORklHX1ZIT1NUX01FTlU9eSB3aWxsIGJlIGxl
ZnQgaW4gdGhlIGRlZmNvbmZpZ3MgZXZlbiBpZiBDT05GSUdfVkhPU1QgaXMKPj4+PiBub3Qgc2V0
Lgo+Pj4+Cj4+Pj4gVGhhbmtzCj4+Pj4KPj4+IEJUVyBkbyBlbnRyaWVzIHdpdGggbm8gcHJvbXB0
IGFjdHVhbGx5IGFwcGVhciBpbiBkZWZjb25maWc/Cj4+Pgo+PiBZZXMuIEkgY2FuIHNlZSBDT05G
SUdfVkhPU1RfRFBOPXkgYWZ0ZXIgbWFrZSBBUkNIPW02OGsgZGVmY29uZmlnCj4gWW91IHNlZSBp
dCBpbiAuY29uZmlnIHJpZ2h0PyBTbyB0aGF0J3MgaGFybWxlc3MgcmlnaHQ/CgoKWWVzLgoKVGhh
bmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
