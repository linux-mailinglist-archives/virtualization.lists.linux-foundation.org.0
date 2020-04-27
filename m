Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AE81BA769
	for <lists.virtualization@lfdr.de>; Mon, 27 Apr 2020 17:09:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9F34586747;
	Mon, 27 Apr 2020 15:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id odThvsI2O-J6; Mon, 27 Apr 2020 15:09:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ED790865D0;
	Mon, 27 Apr 2020 15:09:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6B39C0172;
	Mon, 27 Apr 2020 15:09:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E8B4C0172
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 15:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5D3568790F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 15:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qdpwpO9PYGWW
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 15:09:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 126D387603
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 15:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588000189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xUEFMfWexofFcxzbxXuK5yACNXYPstNO02+oPQHgYAs=;
 b=TgODh7vdBfKG9rG4ifKgJQ984BiKet6b47m4csWweqss4ChbElBnaa4MhsLWI8CMzTu6sJ
 QlPN5jvE9BPoummpST3JHYZIkzsZVJTbSA1Y7kB3oB32PK3L0PrZk/KGQpL8anUfxe63hg
 Xj2O65mewViYS+9k1tnIHyiK/TGEdIo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61--KTyKcFqNV-6_RVOt5jbBw-1; Mon, 27 Apr 2020 11:09:45 -0400
X-MC-Unique: -KTyKcFqNV-6_RVOt5jbBw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2BCC1054F8B;
 Mon, 27 Apr 2020 15:09:44 +0000 (UTC)
Received: from [10.36.114.127] (ovpn-114-127.ams2.redhat.com [10.36.114.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 447245C1D4;
 Mon, 27 Apr 2020 15:09:38 +0000 (UTC)
Subject: Re: [PATCH v2] virtio-balloon: Disable free page reporting if page
 poison reporting is not enabled
To: Alexander Duyck <alexander.duyck@gmail.com>
References: <20200424162103.6681.436.stgit@localhost.localdomain>
 <31bc73ea-5d33-a79d-5f30-dc91b85f9b63@redhat.com>
 <CAKgT0UfhH3pyOqaTcO3yyEE94NsFkgZvVzNDNsyyVqNDgHzGdQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <9d92de1d-5af5-e8e6-23b9-e61d34bbf677@redhat.com>
Date: Mon, 27 Apr 2020 17:09:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAKgT0UfhH3pyOqaTcO3yyEE94NsFkgZvVzNDNsyyVqNDgHzGdQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: virtio-dev@lists.oasis-open.org, virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 27.04.20 16:58, Alexander Duyck wrote:
> On Mon, Apr 27, 2020 at 1:08 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 24.04.20 18:24, Alexander Duyck wrote:
>>> From: Alexander Duyck <alexander.h.duyck@linux.intel.com>
>>>
>>> We should disable free page reporting if page poisoning is enabled in the
>>> kernel but we cannot report it via the balloon interface. This way we can
>>> avoid the possibility of corrupting guest memory. Normally the page poison
>>> reporting feature should always be present when free page reporting is
>>> enabled on the hypervisor, however this allows us to correctly handle a
>>> case of the virtio-balloon device being possibly misconfigured.
>>>
>>> Fixes: 5d757c8d518d ("virtio-balloon: add support for providing free page reports to host")
>>> Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
>>> ---
>>>
>>> Changes since v1:
>>> Originally this patch also modified free page hinting, that has been removed.
>>> Updated patch title and description.
>>> Added a comment explaining reasoning for disabling free page reporting.
>>>
>>>  drivers/virtio/virtio_balloon.c |    9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
>>> index 51086a5afdd4..1f157d2f4952 100644
>>> --- a/drivers/virtio/virtio_balloon.c
>>> +++ b/drivers/virtio/virtio_balloon.c
>>> @@ -1107,11 +1107,18 @@ static int virtballoon_restore(struct virtio_device *vdev)
>>>
>>>  static int virtballoon_validate(struct virtio_device *vdev)
>>>  {
>>> -     /* Tell the host whether we care about poisoned pages. */
>>> +     /*
>>> +      * Inform the hypervisor that our pages are poisoned or
>>> +      * initialized. If we cannot do that then we should disable
>>> +      * page reporting as it could potentially change the contents
>>> +      * of our free pages.
>>> +      */
>>>       if (!want_init_on_free() &&
>>>           (IS_ENABLED(CONFIG_PAGE_POISONING_NO_SANITY) ||
>>>            !page_poisoning_enabled()))
>>>               __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_PAGE_POISON);
>>> +     else if (!virtio_has_feature(vdev, VIRTIO_BALLOON_F_PAGE_POISON))
>>> +             __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_REPORTING);
>>>
>>>       __virtio_clear_bit(vdev, VIRTIO_F_IOMMU_PLATFORM);
>>>       return 0;
>>>
>>
>> Did you see my feedback on v1?
>>
>> https://www.spinics.net/lists/linux-virtualization/msg42783.html
>>
>> In case of want_init_on_free(), we don't really need VIRTIO_BALLOON_F_PAGE_POISON.
> 
> I believe we do. We had discussions earlier in which Michael had
> mentioned that the guest should not assume implementation details of
> the host/hypervisor.

We can simply document this, as I suggested already ("either the old
page, or a page filled with zero"). Perfectly fine IMHO.

> 
> The PAGE_POISON feature is being used to indicate that we expect the
> page to contain a certain value when it is returned to us. With the
> current implementation in QEMU if that value is zero we can work with
> it because that is the effect that MADV_DONTNEED has. However if there
> were some other effect being used by QEMU we would want to know that
> the guest is expecting us to write a 0 page. So I believe it makes
> sense to inform the hypervisor that we are doing something that
> expects us to fill the page with zeros in the case of

Informing makes sense, yes. And we inform it via the poison feature, if
possible. This discussion is about "what happens if the poison feature
is not there, but we do have want_init_on_free()."

> want_init_on_free rather than not providing that information to QEMU.
> This way, if in the future we decide to change the implementation in
> some way that might effect the value contained in the pages, we might

If the hypervisor can no longer guarantee "either the old page, or a
page filled with zero", it would have to disable the feature. I don't
see that happening, really.

> have the flexibility to identify the want_init_on_free case so we can
> work around it.

I don't have a too strong opinion here, but this sounds like one of the
improvements we wanted to have for free page hinting, but learned that
it's not possible because it was *underspecified*.


-- 
Thanks,

David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
