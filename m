Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9058E199727
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 15:13:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 386D888739;
	Tue, 31 Mar 2020 13:13:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N9OzVWn-rbgk; Tue, 31 Mar 2020 13:13:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B831E88726;
	Tue, 31 Mar 2020 13:13:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9137CC07FF;
	Tue, 31 Mar 2020 13:13:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66AC1C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 623E821561
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yBMM3itZ1pC0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:13:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 6B84F22829
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585660387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vhuhyUwYopA1n84wfzfATkQxt+0y/RkX+3b+ZUlYd24=;
 b=UjX+5xEJwuHtbQTZY/f0d5vv+G0tP370C0lBp0Snciuiwg1wDXLZNIfSOpUZgdFf+XNzKJ
 IE8gCPiUtNmHifMhMKTqHKATrPGXriCH0sHzo3wxXtb8v584VxLRewsrWk6xKpnE1EqDRu
 vjErxa45ctGwseiM9Wo6AUjjqDhkUlE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-5f3Vy7HKO9eQA-vGq1yqTQ-1; Tue, 31 Mar 2020 09:13:05 -0400
X-MC-Unique: 5f3Vy7HKO9eQA-vGq1yqTQ-1
Received: by mail-wm1-f72.google.com with SMTP id o5so1044291wmo.6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 06:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vhuhyUwYopA1n84wfzfATkQxt+0y/RkX+3b+ZUlYd24=;
 b=pGjuOqdVrfT2OUInEzrUb8nVItm3kQPPHjcfpk+L/mhGvloEXb0iNFxtPrnvOgc0Hl
 +P/+oTyTK5co6IfCWhKuTTQ9ukULlSAPjc2ti0SzuswDHT6oT8yZnUieWaoDcOILpZsi
 vpPBGOcnkqFR8ED2qQcTDd8WOjoMN1f3fKNQHOhuwhMd9y7PqBk3F1OxSxPzxYSQnCdx
 2UiDy+tfic0UBTONV/5wDSGOjjY+/9WhjE8cG1siUDTSD4ePAk3vEh5Te4HKFwVH3BFU
 0sniNV2CXCoLnj1K5Jy3eGKcQzPGLpma8rQX5fISBWlzLofyOnR6c6EiiFEnkVkqTRWG
 6gAA==
X-Gm-Message-State: ANhLgQ0ht4qC5W16JKNZHrd5OwUIlsEhFz4hYlVxCCHOFvaSD/BXAzA5
 FMJAVxVAR8lXbgluS50+ZwTGpbAjfVz6Cn3FCphoI56jcDSHcWrOZSoHnz8eVydjK+Wn3/CiA26
 pFd/Iz2g9PBNA6giseHC+X/LpDd1Usur2VA0HROBnSw==
X-Received: by 2002:adf:f610:: with SMTP id t16mr20105981wrp.30.1585660384342; 
 Tue, 31 Mar 2020 06:13:04 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuM4mf6PErLBYuIr557Jbfwdq0tffIdJD4BRvVV+5LWR2L1gVxuCah7k8R5X7pszotZ2Uw5HA==
X-Received: by 2002:adf:f610:: with SMTP id t16mr20105970wrp.30.1585660384168; 
 Tue, 31 Mar 2020 06:13:04 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id j188sm3928906wmj.36.2020.03.31.06.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 06:13:03 -0700 (PDT)
Date: Tue, 31 Mar 2020 09:13:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: linux-next: Tree for Mar 30 (vhost)
Message-ID: <20200331091138-mutt-send-email-mst@kernel.org>
References: <20200330204307.669bbb4d@canb.auug.org.au>
 <347c851a-b9f6-0046-f6c8-1db0b42be213@infradead.org>
 <649927d4-9851-c369-2ad2-bf25527b057a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <649927d4-9851-c369-2ad2-bf25527b057a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, KVM <kvm@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
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

T24gVHVlLCBNYXIgMzEsIDIwMjAgYXQgMTA6Mjc6NDhBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzMvMzEg5LiK5Y2IMToyMiwgUmFuZHkgRHVubGFwIHdyb3RlOgo+ID4g
T24gMy8zMC8yMCAyOjQzIEFNLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3RlOgo+ID4gPiBIaSBhbGws
Cj4gPiA+IAo+ID4gPiBUaGUgbWVyZ2Ugd2luZG93IGhhcyBvcGVuZWQsIHNvIHBsZWFzZSBkbyBu
b3QgYWRkIGFueSBtYXRlcmlhbCBmb3IgdGhlCj4gPiA+IG5leHQgcmVsZWFzZSBpbnRvIHlvdXIg
bGludXgtbmV4dCBpbmNsdWRlZCB0cmVlcy9icmFuY2hlcyB1bnRpbCBhZnRlcgo+ID4gPiB0aGUg
bWVyZ2Ugd2luZG93IGNsb3Nlcy4KPiA+ID4gCj4gPiA+IENoYW5nZXMgc2luY2UgMjAyMDAzMjc6
Cj4gPiA+IAo+ID4gPiBUaGUgdmhvc3QgdHJlZSBnYWluZWQgYSBjb25mbGljdCBhZ2FpbnN0IHRo
ZSBrdm0tYXJtIHRyZWUuCj4gPiA+IAo+ID4gKG5vdGU6IHRvZGF5J3MgbGludXgtbmV4dCBpcyBv
biA1LjYtcmM3LikKPiA+IAo+ID4gb24geDg2XzY0Ogo+ID4gCj4gPiAjIENPTkZJR19FVkVOVEZE
IGlzIG5vdCBzZXQKPiA+IAo+ID4gLi4vZHJpdmVycy92aG9zdC92aG9zdC5jOiBJbiBmdW5jdGlv
biAndmhvc3RfdnJpbmdfaW9jdGwnOgo+ID4gLi4vZHJpdmVycy92aG9zdC92aG9zdC5jOjE1Nzc6
MzM6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnZXZlbnRmZF9mZ2V0
JzsgZGlkIHlvdSBtZWFuICdldmVudGZkX3NpZ25hbCc/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0
aW9uLWRlY2xhcmF0aW9uXQo+ID4gICAgIGV2ZW50ZnAgPSBmLmZkID09IC0xID8gTlVMTCA6IGV2
ZW50ZmRfZmdldChmLmZkKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
fn5+fn5+fn5+fn4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBldmVudGZk
X3NpZ25hbAo+ID4gLi4vZHJpdmVycy92aG9zdC92aG9zdC5jOjE1Nzc6MzE6IHdhcm5pbmc6IHBv
aW50ZXIvaW50ZWdlciB0eXBlIG1pc21hdGNoIGluIGNvbmRpdGlvbmFsIGV4cHJlc3Npb24KPiA+
ICAgICBldmVudGZwID0gZi5mZCA9PSAtMSA/IE5VTEwgOiBldmVudGZkX2ZnZXQoZi5mZCk7Cj4g
Cj4gCj4gV2lsbCBmaXguCj4gCj4gVkhPU1Qgc2hvdWxkIGRlcGVuZCBvbiBFVkVOVEZEIG5vdy4K
PiAKPiBUaGFua3MKCgpJIGRpZCB0aGF0IGFuZCBwdXNoZWQuIFBscyB0YWtlIGEgbG9vay4KCj4g
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiA+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
