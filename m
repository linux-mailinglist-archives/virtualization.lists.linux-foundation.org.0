Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3231322A2
	for <lists.virtualization@lfdr.de>; Tue,  7 Jan 2020 10:39:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 53AA220243;
	Tue,  7 Jan 2020 09:39:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nbDBBwBuLWe4; Tue,  7 Jan 2020 09:39:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5DF7720131;
	Tue,  7 Jan 2020 09:39:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 418C6C0881;
	Tue,  7 Jan 2020 09:39:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C63B9C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 09:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AF84684BA5
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 09:39:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 01OZ01BBYbkj
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 09:39:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 05A2384900
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 09:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578389949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KTZsZnppU+2QHEms25h87mEXIcd3CR1WH++YNAVYQNY=;
 b=E0E59r7nXc15Ugy5ig041GMuBr51+WGsKOktoetnTalvgh73vgmZCtbDi2k1dEV2t/vvTS
 NF0q5SadBMqzCTIZPwmZ9VMZilS5R1zSnmDnn21PJx49M9PIagCDaVJ+5r1qEZ+5o1red5
 QonH7W3MrxNhEUs6S2GkVesAdu7Ai1w=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-58gzwFsPPc60i1RrVOOarw-1; Tue, 07 Jan 2020 04:39:06 -0500
Received: by mail-qv1-f70.google.com with SMTP id z9so13721312qvo.10
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Jan 2020 01:39:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KTZsZnppU+2QHEms25h87mEXIcd3CR1WH++YNAVYQNY=;
 b=K1EvU7ayM+vz/xllKa2xmFzvWPSvCfs07chGyfRt5DDq1DzkDW4B21xrlmAtkvhVvZ
 2ReLFK92se+7LI34JomNFNh7MXYrLVwai7WsCSmpTVLXpiN7w38t4RNP0a9TP64S8CSE
 H6cEf7EJ+HjavlN6nf9Jj+fC9Akz95Z6ZkS7m0UGccHhd1MssCpQ9bL4qgMoQSSXsxZP
 0Stb+NUCrrycKacReUNNTOtR74iFjWkyWJt5Wz0Kwg6jBwrf+gU7mbIjC6ahap79JSUw
 VWrW6FVW73GPUxCtwKXzCB+feUAK/zKFR6uiTe4CM8yALXG8GNpZDXLrdDsLnVsioMrK
 VTYw==
X-Gm-Message-State: APjAAAVEu3TidyhWM/W9Vw7NIHmpIh1SfMNwRBuoI5NdaFsjcYwLpYmc
 YMOFUnVkTvXaonkZ4Ho8oD9o/tggl+HEDs43KAnRcv/kMJPCpDLi7Zfp7tHCCkrmBv/pIo7uW60
 Sb3aJ7uzn6i4+a4npU10+9OXeny5Ve30VdYbY3inLJA==
X-Received: by 2002:ac8:1bd4:: with SMTP id m20mr80192051qtk.301.1578389946371; 
 Tue, 07 Jan 2020 01:39:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqxNBSffjTXlW+OajOtddlXmtV11+UXzECSfu7cNC0iRx6P/v+pltqGMwIX+pamDcwsrKCW75A==
X-Received: by 2002:ac8:1bd4:: with SMTP id m20mr80192040qtk.301.1578389946145; 
 Tue, 07 Jan 2020 01:39:06 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id u57sm24900235qth.68.2020.01.07.01.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 01:39:05 -0800 (PST)
Date: Tue, 7 Jan 2020 04:39:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
Message-ID: <20200107042401-mutt-send-email-mst@kernel.org>
References: <c022e1d6-0d57-ae07-5e6b-8e40d3b01f4b@de.ibm.com>
 <20191218100926-mutt-send-email-mst@kernel.org>
 <2ffdbd95-e375-a627-55a1-6990b0a0e37a@de.ibm.com>
 <20200106054041-mutt-send-email-mst@kernel.org>
 <08ae8d28-3d8c-04e8-bdeb-0117d06c6dc7@de.ibm.com>
MIME-Version: 1.0
In-Reply-To: <08ae8d28-3d8c-04e8-bdeb-0117d06c6dc7@de.ibm.com>
X-MC-Unique: 58gzwFsPPc60i1RrVOOarw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Halil Pasic <pasic@linux.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMDk6NTk6MTZBTSArMDEwMCwgQ2hyaXN0aWFuIEJvcm50
cmFlZ2VyIHdyb3RlOgo+IAo+IAo+IE9uIDA2LjAxLjIwIDExOjUwLCBNaWNoYWVsIFMuIFRzaXJr
aW4gd3JvdGU6Cj4gPiBPbiBXZWQsIERlYyAxOCwgMjAxOSBhdCAwNDo1OTowMlBNICswMTAwLCBD
aHJpc3RpYW4gQm9ybnRyYWVnZXIgd3JvdGU6Cj4gPj4gT24gMTguMTIuMTkgMTY6MTAsIE1pY2hh
ZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+Pj4gT24gV2VkLCBEZWMgMTgsIDIwMTkgYXQgMDM6NDM6
NDNQTSArMDEwMCwgQ2hyaXN0aWFuIEJvcm50cmFlZ2VyIHdyb3RlOgo+ID4+Pj4gTWljaGFlbCwK
PiA+Pj4+Cj4gPj4+PiB3aXRoIAo+ID4+Pj4gY29tbWl0IGRiNzI4NmIxMDBiNTAzZWY4MDYxMjg4
NDQ1M2JlZDUzZDc0YzlhMTYgKHJlZnMvYmlzZWN0L3NraXAtZGI3Mjg2YjEwMGI1MDNlZjgwNjEy
ODg0NDUzYmVkNTNkNzRjOWExNikKPiA+Pj4+ICAgICB2aG9zdDogdXNlIGJhdGNoZWQgdmVyc2lv
biBieSBkZWZhdWx0Cj4gPj4+PiBwbHVzCj4gPj4+PiBjb21taXQgNmJkMjYyZDVlYWZjZGY4Y2Rm
YWU0OTFlMmU3NDhlNGU0MzRkY2RhNiAoSEVBRCwgcmVmcy9iaXNlY3QvYmFkKQo+ID4+Pj4gICAg
IFJldmVydCAidmhvc3QvbmV0OiBhZGQgYW4gb3B0aW9uIHRvIHRlc3QgbmV3IGNvZGUiCj4gPj4+
PiB0byBtYWtlIHRoaW5ncyBjb21waWxlICh5b3VyIG5leHQgdHJlZSBpcyBub3QgZWFzaWx5IGJp
c2VjdGFibGUsIGNhbiB5b3UgZml4IHRoYXQgYXMgd2VsbD8pLgo+ID4+Pgo+ID4+PiBJJ2xsIHRy
eS4KPiA+Pj4KPiA+Pj4+Cj4gPj4+PiBJIGdldCByYW5kb20gY3Jhc2hlcyBpbiBteSBzMzkwIEtW
TSBndWVzdHMgYWZ0ZXIgcmVib290Lgo+ID4+Pj4gUmV2ZXJ0aW5nIGJvdGggcGF0Y2hlcyB0b2dl
dGhlciB3aXRoIGNvbW1pdCBkZWNkOWI4ICJ2aG9zdDogdXNlIHZob3N0X2Rlc2MgaW5zdGVhZCBv
ZiB2aG9zdF9sb2ciIHRvCj4gPj4+PiBtYWtlIGl0IGNvbXBpbGUgYWdhaW4pIG9uIHRvcCBvZiBs
aW51eC1uZXh0LTEyMTggbWFrZXMgdGhlIHByb2JsZW0gZ28gYXdheS4KPiA+Pj4+Cj4gPj4+PiBM
b29rcyBsaWtlIHRoZSBiYXRjaGVkIHZlcnNpb24gaXMgbm90IHlldCByZWFkeSBmb3IgcHJpbWUg
dGltZS4gQ2FuIHlvdSBkcm9wIHRoZXNlIHBhdGNoZXMgdW50aWwKPiA+Pj4+IHdlIGhhdmUgZml4
ZWQgdGhlIGlzc3Vlcz8KPiA+Pj4+Cj4gPj4+PiBDaHJpc3RpYW4KPiA+Pj4+Cj4gPj4+Cj4gPj4+
IFdpbGwgZG8sIHRoYW5rcyBmb3IgbGV0dGluZyBtZSBrbm93Lgo+ID4+Cj4gPj4gSSBoYXZlIGNv
bmZpcm1lZCB3aXRoIHRoZSBpbml0aWFsIHJlcG9ydGVyIChpbnRlcm5hbCB0ZXN0IHRlYW0pIHRo
YXQgPGRyaXZlciBuYW1lPSdxZW11Jy8+IAo+ID4+IHdpdGggYSBrbm93biB0byBiZSBicm9rZW4g
bGludXggbmV4dCBrZXJuZWwgYWxzbyBmaXhlcyB0aGUgcHJvYmxlbSwgc28gaXQgaXMgcmVhbGx5
IHRoZQo+ID4+IHZob3N0IGNoYW5nZXMuCj4gPiAKPiA+IE9LIEknbSBiYWNrIGFuZCB0cnlpbmcg
dG8gbWFrZSBpdCBtb3JlIGJpc2VjdGFibGUuCj4gPiAKPiA+IEkgcHVzaGVkIGEgbmV3IHRhZyAi
YmF0Y2gtdjIiLgo+ID4gSXQncyBzYW1lIGNvZGUgYnV0IHdpdGggdGhpcyBiaXNlY3Qgc2hvdWxk
IGdldCBtb3JlIGluZm9ybWF0aW9uLgo+IAo+IEkgZ2V0IHRoZSBmb2xsb3dpbmcgd2l0aCB0aGlz
IHRhZwo+IAo+IGRyaXZlcnMvdmhvc3QvbmV0LmM6IEluIGZ1bmN0aW9uIOKAmHZob3N0X25ldF90
eF9nZXRfdnFfZGVzY+KAmToKPiBkcml2ZXJzL3Zob3N0L25ldC5jOjU3NDo3OiBlcnJvcjogaW1w
bGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYdmhvc3RfZ2V0X3ZxX2Rlc2NfYmF0Y2ji
gJk7IGRpZCB5b3UgbWVhbiDigJh2aG9zdF9nZXRfdnFfZGVzY+KAmT8gWy1XZXJyb3I9aW1wbGlj
aXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICA1NzQgfCAgIHIgPSB2aG9zdF9nZXRfdnFfZGVz
Y19iYXRjaCh0dnEsIHR2cS0+aW92LCBBUlJBWV9TSVpFKHR2cS0+aW92KSwKPiAgICAgICB8ICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gICAgICAgfCAgICAgICB2aG9zdF9nZXRfdnFf
ZGVzYwo+IAoKTm90IHN1cmUgd2h5IGJ1dCBJIHB1c2hlZCBhIHdyb25nIGNvbW1pdC4gU29ycnku
IFNob3VsZCBiZSBnb29kIG5vdy4KCi0tIApNU1QKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
